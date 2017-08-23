module GiphyAdapter

  def self.search
    require 'uri'
    require 'net/http'

    @api_key = ENV['GIPHY_API']

    url = URI("http://api.giphy.com/v1/gifs/search?&rating=pg&q=inspiration&api_key=#{@api_key}")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Get.new(url)
    request["cache-control"] = 'no-cache'
    request["postman-token"] = 'ddadb8a8-50a5-5bcd-8447-943525d278ba'

    response = JSON.parse(http.request(request).body)
    return response
  end
end