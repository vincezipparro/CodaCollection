module Stories
  def visit_stories_page
    visit 'https://codacollection.co/stories'
  end

  def assert_featured_stories_content
    expect(page).to have_xpath("//h3[contains(text(),'Featured Stories')]")
    expect(page).to have_xpath('//div[@data-testid="featuredStory-hero"]')
  end

  def assert_zines_content
    expect(page).to have_xpath('//div[@data-testid="featuredPeriodicalsContainer"]')
    expect(page).to have_xpath('//a[@data-testid="contentCell"]')
    expect(page).to have_xpath('//h2[@data-testid="contentCellTitle"]')
  end

  def assert_all_stories_content
    expect(page).to have_xpath("//h3[contains(text(),'All Stories')]")
    expect(page).to have_xpath('//div[@data-testid="allStoriesContainer"]')
    expect(page).to have_xpath('//div[@data-testid="allStoriesListLink"]')
  end
end
