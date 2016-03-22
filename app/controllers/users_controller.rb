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
      flash[:success] = "Welcome!"
      redirect_to @user
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
