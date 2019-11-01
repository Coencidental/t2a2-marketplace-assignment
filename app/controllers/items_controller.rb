class ItemsController < ApplicationController
  before_action :params_item

  def index
  end

  def show
  end

  def new
  end

  def create 
    @item = Item.new(item_params)
  end

  def edit
  end

  def update 
  end

  def destroy 
  end 

  private 

  def params_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :brand, :description, :returnable, :price)
  end
end
