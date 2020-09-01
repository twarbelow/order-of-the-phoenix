class MovieDb
  def search(query)
    search_responses(query)
  end

  def search_responses(query)
    @response1 = conn.get(
      "characters?key=#{ENV['HARRY_POTTER_KEY']}&house=Gryffindor&orderOfThePhoenix=true"
    )
  end

  def parse_responses(id)
    info = movie_info_request(id)
    @info = JSON.parse(info.body, symbolize_names: true)
  end

  private

  def conn
    @conn ||= Faraday.new(
      url: 'https://www.potterapi.com/v1/',
      params: {
        api_key: ENV['HARRY_POTTER_KEY']
      },
      headers: {
        'Content-Type' => 'application/json'
      }
    )
  end
end
