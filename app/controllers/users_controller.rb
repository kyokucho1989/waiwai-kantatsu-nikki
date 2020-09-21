class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
    #binding.pry
  end

  def create
    User.create!(user_params)    
  end

  def show
    @user = User.find(params[:id])
    #binding.pry
  end

  private
  def user_params
    params.require(:user).permit(:password, :nickname, :email)
  end
end
