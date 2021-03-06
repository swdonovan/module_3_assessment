require 'net/http'

class BestBuyData
    attr_reader :url,
                :key,
                :zipcode

  def initialize(zipcode)
    @zipcode = zipcode
    @key     = ENV['API_KEY']
    @url     = "https://api.bestbuy.com/v1/"
  end

  def stores
    store_data = get_request("#{url}/stores(area(#{zipcode},25))?format=json&show=city,longName,distance,phone,storeType&apiKey=#{key}")
    stores     = parse_response(store_data)
  end

  private
    def get_request(site)
      uri = URI(site)
      @request = Net::HTTP.get(uri)
    end

    def parse_response(data)
      @response = JSON.parse(data)
    end
end
