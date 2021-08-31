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
      redner json: item.errors, status: :unprocessable_entity
    end
  end

  def new
    
  end

  def show
    begin
      @item = Item.find_by!(id: params[:id])
    rescue ActiveRecord::RecordNotFound
      render body: "Page not found", status: 404
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private
  def items_params
    params.permit(:name, :price)
  end
end
