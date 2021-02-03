class UsersController < ApplicationController
     before_action :require_user_logged_in, only: [:edit, :update, :destroy]
     before_action :correct_user, only: [:edit, :update, :destroy]
     before_action :set_message, only: [:show, :edit, :update, :followings, :followers, :likes]
     
     
  def index
    @users = User.order(id: :desc).page(params[:page]).per(20)
  end

  def show
    #set_message
    @guitars = @user.guitars.order(id: :desc).page(params[:page])
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
    #set_message
  end

  def update
    #set_message
 
   if @user.update(user_params)
    flash[:success] = 'ユーザー情報を編集しました。'
    render :edit
   else
    flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
    render :edit
   end 
  end
  
  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    flash[:success] = 'ユーザーを削除しました。'
    redirect_to :root
  end
  
  def followings
    #set_message
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end
  
  def followers
    #set_message
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end
  
  def likes
    #set_message
    @likes = @user.likes.page(params[:page])
    @guitars = @user.guitars.order(id: :desc).page(params[:page])
    counts(@user)
  end
  
  private
  
  def set_message
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,:image,:profile)
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
end
