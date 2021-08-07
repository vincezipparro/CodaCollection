require 'capybara/rspec'

describe 'Coda Collection Challenge' do
  it 'should view a film page and navigate to its corresponding Amazon Prime Video page' do
    visit 'https://codacollection.co/films'

    find(:xpath, "//h2[contains(text(),'What Drives Us')]").click

    find(:xpath, "//div[contains(text(),'Watch now on')]").click

    switch_to_window { title == 'Watch What Drives Us | Prime Video' }

    expect(page).to have_current_path('https://www.amazon.com/gp/video/detail/B093KFSGPJ/?&_encoding=UTF8&tag=coda_whatdrivesus-20&linkCode=ur2&linkId=0fcc7caa9c7e6911a6cc9b56a575ca0b&camp=1789&creative=9325')
    expect(page).to have_xpath("//a[contains(text(),'Prime Video')]")
    expect(page).to have_xpath("//h1[contains(text(),'What Drives Us')]")
  end

  it 'should view the QA Engineer job posting' do
    visit 'https://codacollection.co/jobs'

    expect(page).to have_xpath("//div[contains(text(),'QA Engineer')]")
    find(:xpath, "//div[contains(text(),'QA Engineer')]", match: :first).click

    expect(page).to have_xpath("//div[contains(text(),'Apply Now')]")
    job_posting_url = URI.parse(current_url)
    expect(job_posting_url.to_s).to include('qa-engineer')
  end

  it 'should successfully subscribe to the Coda mailing list' do
    visit 'https://codacollection.co/'

    random_str = rand(10**10)

    find(:xpath, '//div[1]/div[1]/form[1]/div[1]/div[1]/input[1]').set("#{random_str}@gmail.com")

    click_button 'Subscribe'

    expect(page).to have_text("Great. You're in.")
  end

  it 'should view search results related to the band Radiohead' do
    artist = 'radiohead'
    visit "https://codacollection.co/search?q=#{artist}"

    # extract values returned from search for each category and convert them to ints
    artist_count     = find(:xpath, '//div[2]/ul[1]/li[2]/button[1]/div[1]').text.gsub(/[^0-9]/, '').to_i
    collection_count = find(:xpath, '//div[2]/ul[1]/li[3]/button[1]/div[1]').text.gsub(/[^0-9]/, '').to_i
    video_count      = find(:xpath, '//div[2]/ul[1]/li[4]/button[1]/div[1]').text.gsub(/[^0-9]/, '').to_i
    story_count      = find(:xpath, '//div[2]/ul[1]/li[5]/button[1]/div[1]').text.gsub(/[^0-9]/, '').to_i

    # assert search results do not return 0
    expect(artist_count).to be >= 1
    expect(collection_count).to be >= 1
    expect(video_count).to be >= 1
    expect(story_count).to be >= 1
  end
end
