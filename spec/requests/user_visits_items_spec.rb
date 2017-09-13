describe "User visits items API" do
  it "responds with all items" do
    item_one, item_two, item_three = create_list(:item, 3)
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
end
