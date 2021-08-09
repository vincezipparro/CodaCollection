module Films
  def visit_films_page
    visit 'https://codacollection.co/films'
  end

  def view_artist_film_page(film_name)
    visit "https://codacollection.co/films/#{film_name}"

    find(:xpath, "//div[contains(text(),'Watch now on')]").click
  end
end
