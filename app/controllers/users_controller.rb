class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = User.create(params[:user])
      redirect_to users_path, notice:"Success"
    else
      render action:"new", error:"Fail"
    end
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end
end
