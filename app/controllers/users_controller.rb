class UsersController < ApplicationController
  load_and_authorize_resource

 # before_filter :signed_in_user, only: [:index, :edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end



  def index
    @users = User.paginate(page: params[:page], :per_page => 2)
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

  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
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
    params.require(:user).permit(:email, :name,:surname, :password, :password_confirmation)
  end
end
