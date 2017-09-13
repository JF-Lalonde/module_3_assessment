class SearchController < ApplicationController
  def index
    @stores = Store.find_stores(params[:search])
  end
end
