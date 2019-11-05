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
    render json: params
    
   
  end

  private

  def tagword_params
    params.require(:tagword).permit(:tag)
  end
end
