class SearchController < ApplicationController

  def index
    search = params[:search]
    @stores = Store.find_stores(search)
    @total_stores = Store.total_stores(search)
  end
end
