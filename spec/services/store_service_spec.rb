require 'rails_helper'

describe StoreService do
  it "returns nearby stores" do
    zipcode = "80202"
    stores = StoreService.new("80202").return_stores

    expect(stores.count).to eq(10)
    expect(stores[0]).to have_key(:longName)
    expect(stores[0]).to have_key(:city)
    expect(stores[0]).to have_key(:distance)
    expect(stores[0]).to have_key(:phone)
    expect(stores[0]).to have_key(:storeType)
  end
end
