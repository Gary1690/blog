class UsersController < ApplicationController


  def new 
    @user = User.new
  end

  def show
    @user =  User.find(params[:id])
    @articles = @user.articles
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
      redirect_to articles_path
    else 
      render "edit"
    end 
  end 

  private
  def user_params
    params.require(:user).permit(:username,:email,:password)
  end
end