class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all
    head 200
  end
end
