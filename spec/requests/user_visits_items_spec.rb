describe "User visits items API" do
  it "responds with all items" do
    item_one   = Item.create(name: "rock", description: "lumpy", image_url: "http://upload.wikimedia.org/wikipedia/commons/0/06/Item_Industrietechnik_und_Maschinenbau_logo.svg" )
    item_two   = Item.create(name: "scissor", description: "sharp", image_url: "http://upload.wikimedia.org/wikipedia/commons/0/06/Item_Industrietechnik_und_Maschinenbau_logo.svg" )
    item_three = Item.create(name: "hammer", description: "hard", image_url: "http://upload.wikimedia.org/wikipedia/commons/0/06/Item_Industrietechnik_und_Maschinenbau_logo.svg" )
    # When I send a GET request to `/api/v1/items`
    get '/api/v1/items'
    # I receive a 200 JSON response containing all items
    expect(response).to be_success
    # And each item has an id, name, description, and image_url but not the created_at or updated_at
    items = JSON.parse(response.body, symbolize_names: true)

    expect(items.count).to eq(3)
    expect(items.first[:id]).to eq item_one.id
    expect(items.first[:name]).to eq item_one.name
    expect(items.first[:description]).to eq item_one.description
    expect(items.first[:image_url]).to eq item_one.image_url
  end

  it "shows a single item" do
      item_one   = Item.create(name: "rock", description: "lumpy", image_url: "http://upload.wikimedia.org/wikipedia/commons/0/06/Item_Industrietechnik_und_Maschinenbau_logo.svg" )
      item_two   = Item.create(name: "scissor", description: "sharp", image_url: "http://upload.wikimedia.org/wikipedia/commons/0/06/Item_Industrietechnik_und_Maschinenbau_logo.svg" )
      item_three = Item.create(name: "hammer", description: "hard", image_url: "http://upload.wikimedia.org/wikipedia/commons/0/06/Item_Industrietechnik_und_Maschinenbau_logo.svg" )
      # When I send a GET request to `/api/v1/items/1`
      get '/api/v1/items/1'
      # I receive a 200 JSON response
      expect(response).to be_success
      # containing the id, name, description, and image_url but not the created_at or updated_at
      item = JSON.parse(response.body, symbolize_names: true)

      expect(item.count).to eq(1)
      expect(item[:id]).to eq item_one.id
      expect(item[:name]).to eq item_one.name
      expect(item[:description]).to eq item_one.description
      expect(item[:image_url]).to eq item_one.image_url

      get '/api/v1/items/2'
      # I receive a 200 JSON response
      expect(response).to be_success
      # containing the id, name, description, and image_url but not the created_at or updated_at
      item = JSON.parse(response.body, symbolize_names: true)

      expect(item.count).to eq(1)
      expect(item[:id]).to eq item_two.id
      expect(item[:name]).to eq item_two.name
      expect(item[:description]).to eq item_two.description
      expect(item[:image_url]).to eq item_two.image_url
  end
end
