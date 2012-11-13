class SessionsController < ApplicationController
  def new
  end

  def consultant
    user = User.find(params[:id])
    if (user.role == 'consultant')
      session[:user_id] = user.id
      url = qandas_path
      redirect_to url, :notice => "Logged in successfully!"
    else
      flash.now.alert = "Unregistered consultant!"
      render "new"
    end
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.role == 'admin'
        url = users_path
      elsif user.role == 'consultant'
        url = qandas_path
      else
        url = root_url
      end
      redirect_to url, :notice => "Logged in successfully!"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out successfully!"
  end
end
