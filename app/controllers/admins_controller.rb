class AdminsController < ApplicationController
  before_filter :signed_in_admin, only: [:index, :edit, :update]
  before_filter :correct_admin,   only: [:edit, :update]

  def show
    @admin = Admin.find(params[:id])
  end

  def new
    @admin = Admin.new
  end

  def index
    @admins = Admin.paginate(page: params[:page], :per_page => 2)
  end

  def create
    @admin = Admin.new(params[:user])
    if @admin.save
      sign_in @admin
      flash[:success] = ""
      redirect_to @admin
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(params[:admin])
      flash[:success] = "Profile updated"
      sign_in @admin
      redirect_to @admin
    else
      render 'edit'
    end
  end

  private

  def signed_in_admin
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def correct_admin
    @admin = Admin.find(params[:id])
    redirect_to(root_url) unless current_user?(@admin)
  end
end
