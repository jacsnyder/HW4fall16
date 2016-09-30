class SessionsController < ApplicationController

  def session_params
    params.require(:user).permit(:email,:user_id)
  end

  def create
    userLogin = User.find_by(user_id: session_params[:user_id])
    if userLogin.nil?
      flash[:warning] = "Invalid user-id/email combination."
      redirect_to login_path  
    else
      if userLogin.email == session_params[:email]
        session[:session_token] = userLogin.session_token
        redirect_to movies_path
      else
        flash[:warning] = "Invalid user-id/email combination."
        redirect_to login_path  
      end
    end
  end

  def destroy
    session[:session_token] = nil
    redirect_to movies_path
  end

end
