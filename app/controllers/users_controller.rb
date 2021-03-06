class UsersController < ApplicationController

  def user_params
    params.require(:user).permit(:user_id, :email, :session_token)
  end

  def show
    id = params[:id] # retrieve user ID from URI route
    @user = User.find(id) # look up user by unique ID
    # will render app/views/user/show.<extension> by default
  end

  def index
    @users = User.all
  end

  def new
    # default: render 'new' template
  end

  def create
    if user_params[:user_id].empty? or user_params[:email].empty?
      flash[:warning] = "All fields must be filled."
      redirect_to new_user_path
    else
      if User.find_by(user_id: user_params[:user_id]).nil?
        @user = User.create_user!(user_params)
        flash[:notice] = "#{@user.user_id} was successfully created."
        redirect_to login_path
      else
        flash[:notice] = "Sorry, this user-id is taken. Try again."
        redirect_to new_user_path
      end
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update_attributes!(user_params)
    flash[:notice] = "#{@user.user_id} was successfully updated."
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User '#{@user.user_id}' deleted."
    redirect_to users_path
  end

end
