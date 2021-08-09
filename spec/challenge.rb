require 'capybara/rspec'
require 'spec_helper'
include Search
include Redirect
include MailingList
include Discover
include Stories

describe 'Coda Collection Challenge' do
  it 'should assert navigation to film page and redirect to its corresponding Amazon Prime Video page' do
    visit 'https://codacollection.co/films'

    find(:xpath, "//h2[contains(text(),'What Drives Us')]").click

    find(:xpath, "//div[contains(text(),'Watch now on')]").click

    amazon_redirect
  end

  it 'should assert there is a QA Engineer job posting' do
    visit 'https://codacollection.co/jobs'

    expect(page).to have_xpath("//div[contains(text(),'QA Engineer')]")
    find(:xpath, "//div[contains(text(),'QA Engineer')]", match: :first).click

    expect(page).to have_xpath("//div[contains(text(),'Apply Now')]")
    job_posting_url = URI.parse(current_url)
    expect(job_posting_url.to_s).to include('qa-engineer')
  end

  it 'should assert subscription to the Coda mailing list' do
    visit 'https://codacollection.co/'

    random_str = rand(10**10)

    generate_and_submit_email(random_str)

    expect(page).to have_text("Great. You're in.")
  end

  it 'should assert search results related to the band Radiohead' do
    artist_search('radiohead')

    # extract values returned from search for each category and convert them to ints
    artist_count     = search_result('//div[2]/ul[1]/li[2]/button[1]/div[1]')
    collection_count = search_result('//div[2]/ul[1]/li[3]/button[1]/div[1]')
    video_count      = search_result('//div[2]/ul[1]/li[4]/button[1]/div[1]')
    story_count      = search_result('//div[2]/ul[1]/li[5]/button[1]/div[1]')

    # assert search results do not return 0
    expect(artist_count).to be     >= 1
    expect(collection_count).to be >= 1
    expect(video_count).to be      >= 1
    expect(story_count).to be      >= 1
  end

  it 'should assert trending stories are being returned on page' do
    visit 'https://codacollection.co/'

    find(:xpath, "//div[contains(text(),'Trending')]").click

    trending_arr = []
    trending_stories = all(:xpath, '//div[1]/div[2]/div[1]/div[1]/div[2]/div[1]/div[2]/a')

    trending_stories.each do |story|
      trending_arr << story
    end

    verify_trending_div(trending_arr)
  end

  it 'should assert new releases stories are being returned on page' do
    visit 'https://codacollection.co/'

    find(:xpath, "//div[contains(text(),'New Releases')]").click

    new_releases_arr = []
    new_releases = all(:xpath, '//div[1]/div[2]/div[1]/div[1]/div[2]/div[1]/div[2]/a')

    new_releases.each do |story|
      new_releases_arr << story
    end

    verify_new_releases_div(new_releases_arr)
  end

  it 'should assert critical elements on stories page' do
    visit 'https://codacollection.co/stories'

    verify_featured_stories
    verify_zines
    verify_all_stories
  end
end
