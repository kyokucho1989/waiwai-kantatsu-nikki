class UsersController < ApplicationController
  def index
    @users = User.all
    # binding.pry
  end

  def new
    @user = User.new
    # binding.pry
  end

  def create
    # binding.pry
    User.create!(user_params)    
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  def show
    @user = User.find(params[:id])
    # binding.pry
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    # binding.pry
  end

  private
  def user_params
    params.require(:user).permit(:password, :nickname, :email)
  end
end
