class GrowthRecordsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @plants = @user.plants
    @growth_record = @plants.growth_record
    #binding.pry
  end
end
