class ItemsController < ApplicationController
  before_action :params_item, only: [:show, :edit]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
    @bucket = Bucket.find(params[:bucket_id])
  end

  def create 
    @bucket = Bucket.find(params[:bucket_id])
    @item = @bucket.items.new(item_params)
    if @item.save
      redirect_to bucket_path(@bucket)
    else
      flash[:alert] = "Could not save this item!"
      render :new
    end
  end

  def edit
  end

  def update 
    if @item.update(item_params)
      redirect_to @item
    else
      flash[:alert] = "Could not update item!"
      render :edit
    end
  end

  def destroy 
    bucket = params[:bucket_id]
    Item.find(params[:item_id]).destroy
    redirect_to bucket_items_path(bucket)
  end 

  private 

  def params_item
    @item = Item.find(params[:id])
  end

  # Paramater sanitization
  
  def item_params
    params.require(:item).permit(:name, :brand, :description, :returnable, :price)
  end
end
