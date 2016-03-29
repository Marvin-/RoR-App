class UsersController < ApplicationController

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
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
