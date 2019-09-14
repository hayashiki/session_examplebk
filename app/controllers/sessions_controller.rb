class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(session_params[:email])
    if @user&.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to tasks_path, notice: "Login success!!"
    else
      flash[:notice] = 'Email or Password is Invalid'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/', notice: 'You have been signed out.'
  end

  private
  def session_params
    params.permit(:email, :password)
  end
end