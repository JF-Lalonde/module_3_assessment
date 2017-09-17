class StoreService
  def initialize(zipcode)
    @zip = zipcode
    @conn = Faraday.new(url: "https://api.bestbuy.com")
  end

  def get_url(url)
    response = @conn.get(url)
    @result = JSON.parse(response.body, symbolize_names: true)
  end

  def insert_params
    show = "longName,city,distance,phone,storeType&pageSize=10"
    get_url("/v1/stores(area(#{@zip},25))?format=json&show=#{show}&apiKey=#{ENV["KEY"]}")
  end

  def return_stores
    insert_params
    @result[:stores]
  end

  def total_stores
    insert_params
    @result[:total]
  end


  def self.find_stores(zipcode)
    new(zipcode).return_stores
  end

  def self.total_stores(zipcode)
    new(zipcode).total_stores
  end
end
