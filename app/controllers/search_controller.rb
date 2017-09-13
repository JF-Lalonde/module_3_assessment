class SearchController < ApplicationController
  def create
    @stores = Store.find_stores(params[:search])
    redirect_to search_index_path
  end

  def index
    @stores = Store.find_stores("80202")
  end
end
