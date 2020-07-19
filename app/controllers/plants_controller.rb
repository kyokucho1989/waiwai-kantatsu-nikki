class PlantsController < ApplicationController
  def index
    @plants = Plant.all
  end
  
  def new
    @plants = Plant.new
  end
end
