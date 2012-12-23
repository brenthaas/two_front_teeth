class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new()
  end

  def create
    user = User.create(params[:user])
    redirect_to user_path(user)
  end
end