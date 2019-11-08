class LocationsController < ApplicationController
  before_action :authorize_user, only: [:edit, :update]
  
  def show
    @location = current_user.location
  end

  def new
  end

  def create
    @location = Location.new(location_params)
    @location.user = current_user
    if @location.save
      redirect_to @location
    else
      flash[:alert] = "Could not save!"
      render :new
    end
  end

  def edit
    @location = current_user.location
  end

  def update  
    @location = current_user.location 
    @location.update(location_params)
    redirect_to @location
  end

  private

  def authorize_user
    if (Location.find(params[:id]).user != current_user) && (current_user.has_role?(:admin) == false)
      flash[:alert] = "You are not authorized to view this page!"
      redirect_to root_path
    end
  end

  def location_params
    params.require(:location).permit(:address)
  end
end
