class UsersController < ApplicationController

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

  # PUT 
  def change_password
    @user = User.find(session[:user_id])
    if @user.authenticate(params[:old_password])
      @user.password = params[:password]
      @user.password_confirmation = params[:password_confirmation]
      if @user.save
        redirect_to root_path
      else
        flash.now['alert'] = "Password can't validate: Confirmation didn't match?"
        render action:"change_password"
      end
    else
      flash.now['alert'] = "Wrong password"
      render action:"change_password"
    end
  end
end
