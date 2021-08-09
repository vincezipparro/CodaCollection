require 'capybara/rspec'
require 'spec_helper'
include Search
include Redirect
include MailingList
include Discover
include Stories
include Films
include Jobs
include Home

describe 'Coda Collection Challenge - Home Page' do
  before(:each) do
    visit_home_page
  end

  it 'should assert subscription to the Coda mailing list' do
    random_str = rand(10**10)

    generate_and_submit_email(random_str)

    expect(page).to have_text("Great. You're in.")
  end

  it 'should assert trending stories are being returned on page' do
    click_trending_button

    verify_trending_content(collect_trending_stories_arr)
  end

  it 'should assert new releases stories are being returned on page' do
    click_new_releases_button

    verify_new_releases_content(collect_new_release_stories_arr)
  end
end

describe 'Coda Collection Challenge - Other Pages' do
  it 'should assert critical elements on stories page' do
    visit_stories_page

    verify_featured_stories
    verify_zines
    verify_all_stories
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

  it 'should assert navigation to film page and redirect to its corresponding Amazon Prime Video page' do
    view_artist_film_page('what-drives-us')

    amazon_redirect
  end

  it 'should assert there is a QA Engineer job posting' do
    visit_jobs_page

    view_job('QA Engineer')

    verify_job_criteria
  end
end
