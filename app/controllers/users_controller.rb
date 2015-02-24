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
    #@users = User.search(params[:search], params[:page])
    @users = User.order("name").page(params[:page]).per(3)
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
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.js
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :surname, :avatar, :password, :password_confirmation)
  end
end
