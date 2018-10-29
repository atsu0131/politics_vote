class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice:"ユーザー#{@user.name}を登録しました"
    else
      rendar :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.save
      redirect_to user_path(@user), notice:"ユーザー#{@user.name}を更新しました"
    else
      rendar :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to user_path(@user),notice:"ユーザー#{@user.name}を削除しました"
  end

  def show
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation,:sex,:age)
  end

end
