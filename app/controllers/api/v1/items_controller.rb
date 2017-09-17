class Api::V1::ItemsController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    render json: Item.create(item_params)
  end

  def destroy
    Item.delete(params[:id])
    head 204
  end

  private

  def item_params
    params.permit(:name, :description, :image_url)
  end
end
