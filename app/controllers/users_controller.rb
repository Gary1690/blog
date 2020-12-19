class UsersController < ApplicationController

  def index 
    @users = User.paginate(page:params[:page], per_page:5)
  end

  def new 
    @user = User.new
  end

  def show
    @user =  User.find(params[:id])
    @articles = @user.articles.paginate(page:params[:page], per_page:5)
  end 

  def create 
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome, #{@user.username}. You have successfuly loggin."
      redirect_to articles_path
    else
      render "new"
    end
  end

  def edit 
    @user =  User.find(params[:id])
  end 

  def update
    @user =  User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Yoour account information was successfully updated"
      redirect_to user_path(@user)
    else 
      render "edit"
    end 
  end 

  private
  def user_params
    params.require(:user).permit(:username,:email,:password)
  end
end