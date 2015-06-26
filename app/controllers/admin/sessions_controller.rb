class Admin::SessionsController < Admin::ApplicationController
  	layout 'admin/login'
  def new
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path, :notice => "Logged Out"
  end

  def create
  	user = User.authentication(params[:email],params[:password])
  	if user
  		session[:user_id] = user.id
  		redirect_to admin_categories_path, :notice => "Logged In"
  	else
  		flash.now.alert = "Invalid email or password"
  		render 'new'
  	end
  end
end
