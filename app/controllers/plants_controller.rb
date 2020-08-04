class PlantsController < ApplicationController
  def index
    @plants = Plant.all

    @user = User.find(params[:user_id])
    @plant = @user.plants
  end
  
  def new
    @plants = Plant.new
  end

  def show
    @user = User.find(params[:user_id])
    @plant = @user.plants.find(params[:id])
  end
end
