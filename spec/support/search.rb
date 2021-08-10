module Search
  def artist_search(artist_name)
    visit "https://codacollection.co/search?q=#{artist_name}"

    raise 'Unfortunately there is no content related to the artist you are searching for.' if page.has_xpath?("//div[contains(text(),'Bummer, it looks like we don’t have what you’re lo')]")
  end

  def assert_search_results
    # retrieves returned results from the artist, collection, video, and story div
    search_results = all(:xpath, '//ul[1]/li/button[1]/div[1]')

    search_results.each do |result|
      # assert search results do not return 0
      expect(result.text.gsub(/[^0-9]/, '').to_i).to be >= 1
    end
  end
end
