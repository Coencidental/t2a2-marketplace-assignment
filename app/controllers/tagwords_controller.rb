class TagwordsController < ApplicationController
  def create
    @tagword = Tagword.new(tagword_params)
    @item = Item.find(params[:item_id])
    if @tagword.save
      flash[:alert] = "Tagword saved!"
    else
      flash[:alert] = "Tagword could not be saved!"
    end
    @item.tagwords << @tagword
    redirect_to bucket_item_path(@item, @item.id)
  end

  def remove
    
    @item = Item.find(params[:item_id])
    @tag = @item.tagwords.find(params[:tagword])
    if @item.tagwords.delete(@tag)
      flash[:alert] = "Successfully removed tagword" 
    else
      flash[:alert] = "Could not remove tagword"
    end
    redirect_to bucket_item_path(@item.bucket, @item)
  end

  private

  def tagword_params
    params.require(:tagword).permit(:tag)
  end
end
