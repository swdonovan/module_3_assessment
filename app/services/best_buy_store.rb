class BestBuyStore
    attr_reader :zipcode,
                :data
                
  def initialize(zipcode)
    @zipcode = zipcode
    @data    = BestBuyData.new(@zipcode)
  end
end
