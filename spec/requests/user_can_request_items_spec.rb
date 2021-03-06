require 'rails_helper'

describe "When a user makes an API call" do
#When I send a GET request to `/api/v1/items`
#I receive a 200 JSON response containing all items
#And each item has an id, name, description, and image_url but not the created_at or updated_at
  it "returns multiple items" do
    create_list(:item, 3)

    get "/api/v1/items"

    expect(response).to be_success

    items = JSON.parse(response.body)
    expect(items.count).to eq(3)
    expect(items.first["name"]).to eq("SomeItem")
    expect(items.last["description"]).to eq("It itemizes really well")
  end

  #When I send a GET request to `/api/v1/items/1`
  #I receive a 200 JSON response containing the id, name,
  #description, and image_url but not the created_at or updated_at
  it "returns a single item" do
    item = create(:item)

    get "/api/v1/items/#{item.id}"

    expect(response).to be_success
    expect(item.name).to eq("SomeItem")
    expect(item.description).to eq("It itemizes really well")
    expect(item.image_url).to eq("photoshop.com")
  end

#When I send a POST request to `/api/v1/items` with a name, description, and image_url
#I receive a 201 JSON  response if the record is successfully created
#And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at

  it "creates a new item" do
    item_params = {name: "NewItem", description: "Better and shinier", image_url: "coolitem.com"}

    post "/api/v1/items", item_params

    item = Item.last

    expect(response).to be_success
    expect(Item.last["name"]).to eq("NewItem")
  end

#When I send a DELETE request to `/api/v1/items/1`
#I receive a 204 JSON response if the record is successfully deleted

  it "deletes an existing item" do
    id = create(:item).id

    expect(Item.count).to eq(1)

    delete "/api/v1/items/#{id}"

    expect(response).to be_success
    expect(Item.count).to eq(0)
  end
end
