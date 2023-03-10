class UsersController < ApplicationController
  # skip_before_action :login_required, only: %i[ new crete ]
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user), notice: "ユーザが登録されました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end  

  def edit
  end  

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "更新されました" 
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    @user.destroy
      redirect_to users_path, notice: "削除されました"
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, )
  end
end