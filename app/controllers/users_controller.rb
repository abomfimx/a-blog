class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def index
    @users = User.paginate(page: params[:page], per_page: 2)
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 2)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to articles_path,
                  notice: "Welcome to A-Blog #{@user.username.capitalize}, you have successfully signed up"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to user_path, notice: 'Your account information was successfully updated'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
