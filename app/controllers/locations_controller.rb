class LocationsController < ApplicationController

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

  private


  def location_params
    params.require(:location).permit(:address)
  end
end
