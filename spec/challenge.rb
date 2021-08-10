require 'capybara/rspec'
require 'spec_helper'

describe 'Coda Collection Challenge - Home Page' do
  before(:each) do
    visit_home_page
  end

  it 'should assert subscription to the Coda mailing list' do
    random_str = rand(10**10)

    assert_mailing_list_subscription(random_str)
  end

  it 'should assert trending stories are being returned on page' do
    click_trending_button

    assert_trending_content(collect_trending_stories_arr)
  end

  it 'should assert new releases stories are being returned on page' do
    click_new_releases_button

    assert_new_releases_content(collect_new_release_stories_arr)
  end
end

describe 'Coda Collection Challenge - Other Pages' do
  it 'should assert critical elements on stories page' do
    visit_stories_page

    assert_featured_stories_content
    assert_zines_content
    assert_all_stories_content
  end

  it 'should assert search results related to the band Radiohead' do
    artist_search('radiohead')

    assert_search_results
  end

  it 'should assert navigation to film page and redirect to its corresponding Amazon Prime Video page' do
    view_artist_film_page('what-drives-us')

    assert_amazon_redirect
  end

  it 'should assert there is a QA Engineer job posting' do
    visit_jobs_page

    view_job('QA Engineer')

    assert_job_criteria
  end
end
