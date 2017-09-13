class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all
    head 200
  end

  def show
    render json: Item.find(params[:id]), except: [:created_at, :updated_at]
  end
end
