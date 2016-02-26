class UsersController < ApplicationController
  # before_action :if_current_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Thank you for registering for I Heart Beer!"
      redirect_to @user
    else
      flash.now[:error] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    find_user
  end

  def edit
    find_user
  end

  def update
    find_user

    if @user.update(user_params)
      flash[:success] = "Account edited"
      redirect_to @user
    else
      flash.now[:error] = "Failed to update account"
      render :edit
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end
  
  # def if_current_user
  #   @user = User.find(params[:id])
  #   redirect_to :index unless current_user == @user
  # end
end
