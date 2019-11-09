class UsersController < ApplicationController
  
  def show
    

    @user = User.find_by(id: params[:id])
    @sold = []
    @user.buckets.each do |bucket|
      bucket.items.each do |item|
        if item.sold == true
          @sold << item
        end
      end
    end
  end
end
