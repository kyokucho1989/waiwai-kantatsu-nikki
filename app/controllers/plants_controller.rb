class PlantsController < ApplicationController
  def index
    @plants = Plant.all

    @user = User.find(params[:user_id])
    @plants = @user.plants
    #binding.pry
  end
  
  def new
    @user = User.find(params[:user_id])
    @plant = Plant.new
    #binding.pry
  end

  def create
    @plant = Plant.new(plant_params)
    binding.pry
    current_user.plants.create(plant_params)
    #Plant.create(plant_params) 
    
  end

  def show
    @user = User.find(params[:user_id])
    @plant = @user.plants.find(params[:id])
  end

  def destroy
    binding.pry
    @plant = current_user.plants.find(params[:id])
    #binding.pry
    @plant.destroy

  end

  private
  def plant_params
    params.require(:plant).permit(:user_id, :plant_name, :img)
  end

end
