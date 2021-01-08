class CommentsController < ApplicationController
  
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.guitar_id = params[:guitar_id]
    if @comment.save
       flash[:success] = "投稿しました"
       redirect_to @comment.guitar
    else
      @guitar = Guitar.find(params[:guitar_id])  
      @comments = @guitar.comments
      redirect_to root_url
    end
  end

  def destroy
    @guitar = Guitar.find(params[:guitar_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
