class SessionController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @params = params
    @user = User.authenticate(params[:user])
    if @user
      login_as(@user)
      redirect_to projects_path
    else
      flash[:notice] = "Could not log you in"
      @user = User.new
      render :new
    end
  end

  def foo
    log_out
    redirect_to signin_path
  end
end
