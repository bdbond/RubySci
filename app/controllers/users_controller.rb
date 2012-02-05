class UsersController < ApplicationController

  http_basic_authenticate_with name:'p',password:'oop'

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.role_id = 11 # default role is user
    if @user.save
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
