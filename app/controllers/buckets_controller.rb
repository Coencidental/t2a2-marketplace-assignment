class BucketsController < ApplicationController
  before_action :params_bucket, only: [:show, :edit, :update]
  before_action :authenticate_user!
  
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
    @bucket = Bucket.new
  end

  def create
    @bucket = Bucket.new(bucket_params)
    @bucket.user = current_user
    if @bucket.save
      redirect_to @bucket
    else
      flash[:alert] = "Could not save!"
      render :new
    end
  end

  def edit
  end

  def update 
    if @bucket.update(bucket_params)
      redirect_to @bucket
    else
      flash[:alert] = "Could not update bucket!"
      render :edit
    end
  end

  def destroy 
    Bucket.find(params[:bucket_id]).destroy
    redirect_to buckets_path
  end

  private

  def params_bucket
    @bucket = Bucket.find(params[:id])
  end

  # Paramater sanitization

  def bucket_params
    params.require(:bucket).permit(:name, :description)
  end
end
