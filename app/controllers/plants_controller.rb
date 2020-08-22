class PlantsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @plants = Plant.all

    @user = User.find(params[:user_id])
    @plants = @user.plants
    #binding.pry
  end
  
  def move_to_index
    # 自分以外のユーザーの植物の 編集/削除/新規作成はできない
    if (user_signed_in?)    
      if (params[:user_id].to_i != current_user.id)
        redirect_to action: :index
      end
    elsif
        redirect_to action: :index
    end
  end

  def new
    @user = User.find(params[:user_id])
    @plant = Plant.new
    #binding.pry
  end

  def create
    @plant = Plant.new(plant_params)
    #binding.pry
    current_user.plants.create(plant_params)
    
  end

  def show
    @user = User.find(params[:user_id])
    @plant = @user.plants.find(params[:id])
    @growth_record = @plant.growth_record
    # binding.pry

  end

  def edit
    @user = User.find(params[:user_id])
    @plant = @user.plants.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @plant = @user.plants.find(params[:id])
    @plant.update(plant_params)
  end

  def destroy
    #binding.pry
    #@plant = @user.plants.find(params[:id])
    @plant = current_user.plants.find(params[:id])
    #binding.pry
    @plant.destroy

  end

  private
  def plant_params
    params.require(:plant).permit(:user_id, :plant_name, :img)
  end

end
