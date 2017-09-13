class Store
  attr_reader :name,
              :city,
              :distance,
              :phone_number,
              :store_type

  def initialize(attributes = {})
    @name = attributes[:longName]
    @city = attributes[:city]
    @distance = attributes[:distance]
    @phone_number = attributes[:phone]
    @store_type = attributes[:storeType]
  end

  def self.find_stores(zipcode)
    stores = StoreService.new(zipcode).return_stores
    stores.map do |store|
      Store.new(store)
    end
  end
end
