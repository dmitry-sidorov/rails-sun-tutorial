class ItemsController < ApplicationController
  layout false
  skip_before_action :verify_authenticity_token

  def index
    @items = Item.all
  end

  def create
    item = Item.create(items_params)
    if item.persisted?
      render json: item, status: :created
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

  def new
    
  end

  def show
    @item = find_item_by_id(params[:id])
  end

  def edit
    @item = find_item_by_id(params[:id])
  end

  def update
    item = find_item_by_id(params[:id])

    if item.update(items_params)
      redirect_to item_path
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    item = find_item_by_id(params[:id])
    item.destroy

    if item.destroyed?
      redirect_to items_path
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

  private
  def items_params
    params.permit(:name, :price)
  end

  def find_item_by_id(id)
    begin
      Item.find_by!(id: id)
    rescue ActiveRecord::RecordNotFound
      render body: "Page not found", status: 404
    end
  end
end
