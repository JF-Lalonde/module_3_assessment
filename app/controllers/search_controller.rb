class SearchController < ApplicationController
  def index
    @stores = Store.find_stores(params[:zip])
  end
end
