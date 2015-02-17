class SessionsController < ApplicationController
  def new
  end

def create
  admin = Admin.authenticate(params[:session][:email], params[:session][:password])
  if admin
    session[:admin_id]=admin.id
    if user = User.authenticate(params[:session][:email], params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    end
    redirect_to users_path, :notice => "Logged in!"
  else
    flash.now.alert = "Invalid email or password"
    render "new"
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
