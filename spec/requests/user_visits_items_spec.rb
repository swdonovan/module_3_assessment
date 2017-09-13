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
    expect(items.first[:created_at]).to eq nil
    expect(items.first[:updated_at]).to eq nil
  end

  it "shows a single item" do
    item_one   = Item.create(name: "rock", description: "lumpy", image_url: "http://upload.wikimedia.org/wikipedia/commons/0/06/Item_Industrietechnik_und_Maschinenbau_logo.svg" )
    item_two   = Item.create(name: "scissor", description: "sharp", image_url: "http://upload.wikimedia.org/wikipedia/commons/0/06/Item_Industrietechnik_und_Maschinenbau_logo.svg" )
    item_three = Item.create(name: "hammer", description: "hard", image_url: "http://upload.wikimedia.org/wikipedia/commons/0/06/Item_Industrietechnik_und_Maschinenbau_logo.svg" )
    # When I send a GET request to `/api/v1/items/1`
    get "/api/v1/items/#{item_one.id}"
    # I receive a 200 JSON response
    expect(response).to be_success
    # containing the id, name, description, and image_url but not the created_at or updated_at
    item = JSON.parse(response.body, symbolize_names: true)

    expect(item.length).to eq(4)
    expect(item[:id]).to eq item_one.id
    expect(item[:name]).to eq item_one.name
    expect(item[:description]).to eq item_one.description
    expect(item[:image_url]).to eq item_one.image_url
    expect(item[:created_at]).to eq nil
    expect(item[:updated_at]).to eq nil

    get "/api/v1/items/#{item_two.id}"
    # I receive a 200 JSON response
    expect(response).to be_success
    # containing the id, name, description, and image_url but not the created_at or updated_at
    item = JSON.parse(response.body, symbolize_names: true)

    expect(item.count).to eq(4)
    expect(item[:id]).to eq item_two.id
    expect(item[:name]).to eq item_two.name
    expect(item[:description]).to eq item_two.description
    expect(item[:image_url]).to eq item_two.image_url
    expect(item[:created_at]).to eq nil
    expect(item[:updated_at]).to eq nil
  end

  it "Deletes a specific item" do
    item_one   = Item.create(name: "rock", description: "lumpy", image_url: "http://upload.wikimedia.org/wikipedia/commons/0/06/Item_Industrietechnik_und_Maschinenbau_logo.svg" )
    item_two   = Item.create(name: "scissor", description: "sharp", image_url: "http://upload.wikimedia.org/wikipedia/commons/0/06/Item_Industrietechnik_und_Maschinenbau_logo.svg" )
    item_three = Item.create(name: "hammer", description: "hard", image_url: "http://upload.wikimedia.org/wikipedia/commons/0/06/Item_Industrietechnik_und_Maschinenbau_logo.svg" )
    # When I send a DELETE request to `/api/v1/items/1`
    expect{delete "/api/v1/items/#{item_two.id}"}.to change(Item, :count).by(-1)
    # I receive a 204 JSON response
    expect(response).to be_success
    # if the record is successfully deleted
    expect{Item.find(item_one.id)}.to_not raise_error(ActiveRecord::RecordNotFound)
    expect{Item.find(item_two.id)}.to raise_error(ActiveRecord::RecordNotFound)

    count = Item.count

    delete "/api/v1/items/#{item_one.id}"
    expect(response).to be_success

    expect(Item.count).to eq (count - 1)
  end

  it "can create a new item to our DB" do
    item_params = {name: "rock", description: "lumpy", image_url: "http://upload.wikimedia.org/wikipedia/commons/0/06/Item_Industrietechnik_und_Maschinenbau_logo.svg" }

    post "/api/v1/items", params: {item: item_params}
    item = Item.last

    expect(response).to be_success
    expect(item.name).to eq(item_params[:name])
    expect(item.description).to eq(item_params[:description])
    expect(item.image_url).to eq(item_params[:image_url])
  end
end
