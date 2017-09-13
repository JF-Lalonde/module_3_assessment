class Store
  def find_stores(zipcode)
    StoreService.return_stores(zipcode)
  end
end
