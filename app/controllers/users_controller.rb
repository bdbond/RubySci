class UsersController < ApplicationController

  http_basic_authenticate_with name:'admin',password:'tooloo'

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
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
