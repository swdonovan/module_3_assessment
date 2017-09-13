describe BestBuyStore do
  before(:each) do
    zipcode = 80202

    @store = BestBuyStore.new(zipcode)
  end

  describe "#methods" do
    it "finds correct zipcode" do
      expect(@store).to be_instance_of BestBuyStore
      expect(@store.zipcode).to eq 80202
    end

    it "#data -- initializes to bestbuy data poro" do
      expect(@store.data).to be_instance_of BestBuyData
    end

    it "#all -- returns array of objects" do
      expect(@store.all.count).to eq 11
    end
  end
end
