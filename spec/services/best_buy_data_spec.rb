describe BestBuyData do
  before(:each) do
    zipcode = 80202

    @data = BestBuyData.new(zipcode)
  end

  describe "#methods" do
    it "finds correct zipcode" do
      expect(@data).to be_instance_of BestBuyData
      expect(@data.zipcode).to eq 80202
    end

    it "#key" do
      key = ENV['API_KEY']
      expect(@data.key).to eq(key)
    end

    it "#url" do
      expect(@data.url).to eq "https://api.bestbuy.com/v1/"
    end

    it "#stores" do
      zipcode = 80202
      store_zip = BestBuyStore.new(zipcode)
      expect(@data.stores).to eq store_zip.data.stores
    end
  end
end
