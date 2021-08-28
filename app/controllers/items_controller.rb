class ItemsController < ApplicationController
  layout false
  skip_before_action :verify_authenticity_token

  def index
    @items = Item.all

    render json: @items
  end

  def create
    item = Item.create(items_params)
    if item.persisted?
      render json: item, status: :created
    else
      redner json: item.errors, status: :unprocessable_entity
    end
  end

  private
  def items_params
    params.permit(:name, :price)
  end
end
