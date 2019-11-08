class BucketsController < ApplicationController
  before_action :params_bucket, only: [:show, :edit, :update]
  before_action :authenticate_user!
  before_action :authorize_user, only: [:edit, :destroy]

  require 'geocoder'

  def index
    @location = current_user.location
    @locations = Location.all

    @users = User.all
    @sortedusers = []
    @locations.each do |location|
        unless location === @location
        @sortedusers << [location.distance_to(@location), location]
        end
      end

    @sortedusers = @sortedusers.sort

    if params[:search] != nil
      @items = Item.where('name LIKE ?', ("%#{params[:search]}%" || "%#{params[:search].upcase}%" || "%#{params[:search].downcase}%" || "%#{params[:search].capitalize}%"))
      @allitems = []
      @items.each do |item|
        @allitems << item
      end 
      @buckets = []
      @allitems.each do |item|
        @buckets << item.bucket
      end
      @buckets = @buckets.uniq

      if @buckets == nil 
        flash[:alert] = "Could not find any matching items!"
      end
    else
      @buckets = Bucket.all.order(user_id: :desc)
    end
  end

  def user
    if current_user.buckets.count > 0
      @buckets = current_user.buckets.all
    else
      @buckets = nil
    end
  end

  def show
    @bucket = Bucket.find(params[:id])
    @user = @bucket.user
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

  def authorize_user
    if (Bucket.find(params[:id]).user != current_user) && (current_user.has_role?(:admin) == false)
      flash[:alert] = "You are not authorized to view this page!"
      redirect_to root_path
    end
  end

  def params_bucket
    @bucket = Bucket.find(params[:id])
  end

  # Paramater sanitization

  def bucket_params
    params.require(:bucket).permit(:name, :description)
  end
end
