class SearchController < ApplicationController
  def create
    byebug
    @stores = Store.find_stores(params[:search])
  end
end
