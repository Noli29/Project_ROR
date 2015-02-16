class SessionsController < ApplicationController
  def new
  end

def create
    if params[:admin] == 'true'
      admin = Admin.authenticate(params[:email], params[:password])
      if admin
        session[:admin_id] = admin.id
        session[:user_id] = user.id
        redirect_to users_path, :notice => "Logged in!"
      else
        flash.now.alert = "Invalid email/password combination"
        render "new"
      end
  else
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:admin_id] = nil
      session[:user_id] = user.id
      redirect_to user, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email/password combination"
      render "new"
    end
  end

 end

  def destroy
    if params[:admin] == 'true'
      session[:admin_id] = nil
      else
      session[:user_id] = nil
    end
    redirect_to root_url, :notice => "Logged out!"
  end

end
