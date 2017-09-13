require 'rails_helper'

describe StoreService do
  it "returns nearby stores" do
    zipcode = "80202"
    stores = StoreService.new("80202").return_stores

    expect(stores.count).to eq(10)

  end
end
