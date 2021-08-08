module Search
  def artist_search(artist_name)
    visit "https://codacollection.co/search?q=#{artist_name}"

    raise 'Unfortunately there is no content related to the artist you are searching for.' if page.has_xpath?("//div[contains(text(),'Bummer, it looks like we don’t have what you’re lo')]")
  end

  def search_result(xpath)
    find(:xpath, xpath).text.gsub(/[^0-9]/, '').to_i
  end
end
