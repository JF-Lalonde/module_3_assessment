require 'rails_helper'

#When I send a GET request to `/api/v1/items`
#I receive a 200 JSON response containing all items
#And each item has an id, name, description, and image_url but not the created_at or updated_at
describe "When a user makes an API call" do
  it "returns multiple items" do
    items = create_list(:item, 3)
    item = items.first

    get "/api/v1/items"

    expect(response).to be_success
    expect(items.count).to eq(3)
    expect(item.name).to eq("SomeItem")
    expect(item.description).to eq("It itemizes really well")
    expect(item.image_url).to eq("photoshop.com")
  end
end
