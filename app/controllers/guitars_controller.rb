class GuitarsController < ApplicationController
    before_action :require_user_logged_in
    
    def index
        @guitars = Guitar.all
    end
    
    def new
        @guitar = Guitar.new
    end
  
  def create
    @guitar = current_user.guitars.build(guitar_params)
    if @guitar.save
      flash[:success] = '投稿しました。'
      redirect_to root_url
    else
      @guitars = current_user.guitars.order(id: :desc).page(params[:page])
      flash.now[:danger] = '投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @guitar = Guitar.find(params[:id])
    @guitar.destroy
    flash[:success] = '削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def guitar_params
    params.require(:guitar).permit(:content,:name,:category)
  end

  def correct_user
    @guitar = current_user.guitars.find_by(id: params[:id])
    unless @guitar
      redirect_to root_url
    end
  end
end