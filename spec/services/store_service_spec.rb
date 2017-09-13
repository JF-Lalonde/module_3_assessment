require 'rails_helper'

describe StoreService do
  it "returns nearby stores" do
    zipcode = "80202"
    stores = StoreService.return_stores(zipcode)

    expect(stores.count).to eq(10)

  end
end
