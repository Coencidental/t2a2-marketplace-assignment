class BucketsController < ApplicationController
  def index
    @buckets = Bucket.all.order(user_id: :desc)
  end

  def user
    if current_user.buckets.count > 0
      @buckets = current_user.buckets.all
    else
      @buckets = nil
    end
  end

  def show
  end

  def new
  end

  def create

  end

  def edit
  end

  def update 

  end

  def destroy 

  end

  private

  def bucket_params
    params.require(:bucket).permit(:name, :description)
  end
end
