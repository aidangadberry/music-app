class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(email: params[:user][:email])
    @user.password = params[:user][:password]
    if @user.save
      login(@user)
      redirect_to bands_url
    else
      redirect_to new_user_url
    end
  end

  private

  # def user_params
  #   User.require(:user).permit(:email, )
  # end
end
