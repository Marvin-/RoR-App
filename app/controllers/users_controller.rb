class UsersController < ApplicationController

  def new 
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def create 
    # @user = User.new(username: params[:username], :email => params[:email],
                     # :password => params[:password])
    @user = User.new(user_params)
    @user.save
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  def edit 
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    
    redirect_to user_path
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
