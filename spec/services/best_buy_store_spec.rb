describe BestBuyStore do
  before(:each) do
  zipcode = 80202

  @store = BestBuyStore.new(zipcode)
  end

  describe "#zipcode" do
    it "finds correct zipcode"
    expect(@store.zipcode).to eq 80202
  end

  describe "#data" do
    it "initializes to bestbuy data poro"
    expect(@store.data).to be_instance_of BestBuyData
  end

  describe "#all" do
    it "returns array of objects"
    expect(@store.all).to be_instance_of BestBuyData
    expect(@store.all.count).to eq 17
  end
end
