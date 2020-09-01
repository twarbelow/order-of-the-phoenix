class HarryPotterService
  def search_gryffindor
    response = conn.get(
      "characters?key=#{ENV['HARRY_POTTER_KEY']}&house=Gryffindor&orderOfThePhoenix=true"
    )
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    @conn ||= Faraday.new(
      url: 'https://www.potterapi.com/v1/',
      headers: {
        'Content-Type' => 'application/json'
      }
    )
  end
end
