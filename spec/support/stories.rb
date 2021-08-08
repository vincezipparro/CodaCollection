module Stories
  def verify_featured_stories
    expect(page).to have_xpath("//h3[contains(text(),'Featured Stories')]")
    expect(page).to have_xpath('//div[@data-testid="featuredStory-hero"]')
  end

  def verify_zines
    expect(page).to have_xpath('//div[@data-testid="featuredPeriodicalsContainer"]')
    expect(page).to have_xpath('//div[@data-testid="contentCell"]')
    expect(page).to have_xpath('//div[@data-testid="contentCellTitle"]')
  end

  def verify_all_stories
    expect(page).to have_xpath("//h3[contains(text(),'All Stories')]")
    expect(page).to have_xpath('//div[@data-testid="allStoriesContainer"]')
    expect(page).to have_xpath('//div[@data-testid="allStoriesListLink"]')
  end
end
