class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    #debugger
  end

  def create
    @user = User.new(user_params)
    if @user.save # 处理注册成功的情况
      log_in @user
      flash[:success] = "欢迎您来到我的范例网站!"
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.destroy(params[:id])
    flash[:success] = "User Deleted!"
    redirect_to users_url
  end

  # 确保是管理员
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # 确保用户已登录
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in FIRST!"
        redirect_to login_url
      end
    end

    # 确保是正确的用户
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) if !current_user? @user
    end

end
