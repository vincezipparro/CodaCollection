module Films
  def visit_films_page
    visit 'https://codacollection.co/films'
  end

  def view_artist_film_page(film_name)
    visit "https://codacollection.co/films/#{film_name}"

    find(:xpath, "//div[contains(text(),'Watch now on')]").click
  end

  def assert_amazon_redirect
    switch_to_window { title == 'Watch What Drives Us | Prime Video' }

    expect(page).to have_current_path('https://www.amazon.com/gp/video/detail/B093KFSGPJ/?&_encoding=UTF8&tag=coda_whatdrivesus-20&linkCode=ur2&linkId=0fcc7caa9c7e6911a6cc9b56a575ca0b&camp=1789&creative=9325')
    expect(page).to have_xpath("//a[contains(text(),'Prime Video')]")
    expect(page).to have_xpath("//h1[contains(text(),'What Drives Us')]")
  end
end
