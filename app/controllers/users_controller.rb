class UsersController < ApplicationController
  def new
    @user = User.new
    render 'new.html.erb'
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'Successfully created account!'
      redirect_to '/login'
    else
      flash[:warning] = 'Invalid email or password!'
      render 'new.html.erb'
    end
  end
end
