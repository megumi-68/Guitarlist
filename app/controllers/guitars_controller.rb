class GuitarsController < ApplicationController
    before_action :require_user_logged_in
    before_action :correct_user, only: [:edit, :destroy]
    
    def index
      @guitars = Guitar.all
    end
    
    def new
      @guitar = Guitar.new
    end
    
    def show
      @guitar = Guitar.find(params[:id])
      @comment = Comment.new
    end
    
   
    def create
      @guitar = current_user.guitars.build(guitar_params)
     if @guitar.save
      flash[:success] = '投稿しました。'
      redirect_to root_url
     else
      @guitars = current_user.feed_guitars.order(id: :desc).page(params[:page])
      flash.now[:danger] = '投稿に失敗しました。'
      render :new
     end
    end
    
    def edit
      @guitar = Guitar.find(params[:id])
    end
    
    def update
      guitar = Guitar.find(params[:id])
      guitar.update(guitar_params)

      redirect_to guitar
    end

    def destroy
      @guitar = Guitar.find(params[:id])
      @guitar.destroy
      flash[:success] = '削除しました。'
      redirect_back(fallback_location: root_path)
    end

  private

    def guitar_params
      params.require(:guitar).permit(:content,:name,:category,:comment,:photo)
    end
  
    def correct_user
      @guitar = current_user.guitars.find_by(id: params[:id])
      unless @guitar
        redirect_to root_url
      end
    end
end