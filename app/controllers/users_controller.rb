class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def new 
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create 
    # @user = User.new(username: params[:username], :email => params[:email],
                     # :password => params[:password])
    @user = User.new(user_params)
    @user.save
    if @user.save
      log_in @user
      flash[:success] = "Account successfully created."
      redirect_to @user
    else
      render :new
    end
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  #before filters

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user? @user 
  end

end
