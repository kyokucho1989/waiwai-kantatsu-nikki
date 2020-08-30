class GrowthRecordsController < ApplicationController

  # before_action :move_to_index, except: [:index, :show]

  def index
    @user = User.find(params[:user_id])
    @plants = @user.plants
    @growth_record = @plants.growth_record
    #binding.pry
  end

  # def move_to_index
  #   # 自分以外のユーザーの植物の 編集/削除/新規作成はできない
  #   if (user_signed_in?)    
  #     if (params[:user_id].to_i != current_user.id)
  #       redirect_to action: :index
  #     end
  #   elsif
  #       redirect_to action: :index
  #   end
  # end

  def new
    @user = User.find(params[:user_id])
    @plant = Plant.find(params[:plant_id])
    @growth_record = GrowthRecord.new
    # binding.pry
  end

  def create
    @growth_record = GrowthRecord.new(record_params)
    @plant = Plant.find(params[:plant_id])
    @plant.growth_record.create(record_params)
    # binding.pry
  end

  def show

  end

  def edit
    @growth_record = GrowthRecord.find(params[:id])
  end

  def update
    @growth_record = GrowthRecord.find(params[:id])
    @growth_record.update(record_params)
    # binding.pry
  end

  def destroy
    @growth_record = GrowthRecord.find(params[:id])
    @growth_record.destroy
    # binding.pry
  end

  private
  def record_params
    params.require(:growth_record).permit(:temp, :humid)
  end

end
