class PlantsController < ApplicationController
  def index
    @plants = Plant.all

    @user = User.find(params[:user_id])
    @plant = @user.plants
  end
  
  def new
    @user = User.find(params[:user_id])
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(params[:plant])
    #@entry = Entry.new(params[:entry])
  end

  def show
    @user = User.find(params[:user_id])
    @plant = @user.plants.find(params[:id])
  end

end
