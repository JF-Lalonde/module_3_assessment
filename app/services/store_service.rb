class StoreService
  def initialize(zipcode)
    @zipcode = zipcode
    @conn = Faraday.new(url: "https://api.bestbuy.com")
  end

  def return_stores
    response = @conn.get("/v1/stores(area(#{@zipcode},25))?format=json&show=longName,city,distance,phone,storeType&pageSize=10&apiKey=#{ENV["API_KEY"]}")
    info = JSON.parse(response.body, symbolize_names: true)
    @total_stores = info[:total]
    info[:stores]
  end

end
