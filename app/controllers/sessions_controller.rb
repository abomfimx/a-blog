class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user, notice: 'Logged in successfully.'
    else
      flash.now[:alert] = 'There is something wrong with your login'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, status: :see_other, notice: 'Logged out'
  end
end
