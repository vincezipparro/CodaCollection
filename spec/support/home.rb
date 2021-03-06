module Home
  def visit_home_page
    visit 'https://codacollection.co/'
  end

  def click_trending_button
    find(:xpath, "//div[contains(text(),'Trending')]").click
  end

  def click_new_releases_button
    find(:xpath, "//div[contains(text(),'New Releases')]").click
  end

  def collect_trending_stories_arr
    trending_arr = []
    trending_stories = all(:xpath, '//div[1]/div[2]/div[1]/div[1]/div[2]/div[1]/div[2]/a')

    trending_stories.each do |story|
      trending_arr << story
    end
  end

  def collect_new_release_stories_arr
    new_releases_arr = []
    new_releases = all(:xpath, '//div[1]/div[2]/div[1]/div[1]/div[2]/div[1]/div[2]/a')

    new_releases.each do |story|
      new_releases_arr << story
    end
  end

  def assert_mailing_list_subscription(email_name)
    find(:xpath, '//form[1]/div[1]/div[1]/input[1]').set("#{email_name}@gmail.com")

    click_button 'Subscribe'
    expect(page).to have_text("Great. You're in.")
  end

  def assert_trending_content(arr)
    raise 'Not enough or no trending stories are being returned' if arr.count == 0 || arr.count < 6

    expect(arr.count).to eq(6)
  end

  def assert_new_releases_content(arr)
    raise 'Not enough or no new release stories are being returned' if arr.count == 0 || arr.count < 6

    expect(arr.count).to eq(6)
  end
end
