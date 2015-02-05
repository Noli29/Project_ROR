class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:admin] == 'true'
      admin = Admin.find_by_email(params[:session][:email].downcase)
      if admin && admin.authenticate(params[:session][:password])
        sign_in admin
        redirect_back_or admin
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  else
    end
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
 end

  def destroy
    sign_out
    redirect_to root_url
  end
end
