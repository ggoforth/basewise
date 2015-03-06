class RegisterController < ApplicationController
  def new
    #setup a blank empty user for our views
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #saved
      login_as(@user)
      flash[:notice] = "You have successfully registered"
      redirect_to projects_path
    else
      #not saved
      render :new
    end
  end

private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end
