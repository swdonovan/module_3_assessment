class BestBuyStore
    attr_reader :zipcode,
                :data

  def initialize(zipcode)
    @zipcode = zipcode
    @data    = BestBuyData.new(@zipcode)
  end

  def all
    data.stores
  end
end
