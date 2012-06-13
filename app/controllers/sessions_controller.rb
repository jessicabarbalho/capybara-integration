class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = login(params[:email], params[:password])
    if user
      redirect_back_or_to users_path, :notice => "Logged in!"
    else
      redirect_to(login_path, :notice => "Email or password invalid!")
    end
  end

  def destroy
    logout
    redirect_to home_index_path, :notice => "Logged out!"
  end
end
