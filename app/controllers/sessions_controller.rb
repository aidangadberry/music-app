class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    p params[:user][:email], params[:user][:password]
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    p @user
    if @user
      login(@user)
      redirect_to user_url(@user.id)
    else
      redirect_to new_session_url
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
