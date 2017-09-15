class BestBuyStore
  attr_reader :longname,
              :city,
              :distance,
              :phone,
              :store_type,
              :total

  def initialize(store, total)
    @longname   = store['longName']
    @city       = store['city']
    @distance   = store['distance']
    @phone      = store['phone']
    @store_type = store['storeType']
    @total      = total
  end

  def self.stores(zipcode)
    zipcode = zipcode
    bb_stores   = BestBuyData.new(zipcode)
    total = bb_stores.stores['total']
    bb_stores.stores['stores'].map {|store| BestBuyStore.new(store, total)}
  end

  def all
    data.stores
  end
end
