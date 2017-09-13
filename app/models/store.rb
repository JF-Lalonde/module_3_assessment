class Store
  def self.find_stores(zipcode)
    StoreService.return_stores(zipcode)
  end
end
