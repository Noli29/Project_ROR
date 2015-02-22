class UsersController < ApplicationController
  load_and_authorize_resource

  respond_to :html, :js

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def index
    @users = User.search(params[:search], params[:page])
  end

  def create
   @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = ""
      redirect_to @user
    else
      render 'new'
    end
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user) }
        format.js
      else
        format.html { render :action => "edit" }
        format.js
      end
    end
    if @user.update_attributes(params[:user])
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :surname, :avatar, :password, :password_confirmation)
  end
end
