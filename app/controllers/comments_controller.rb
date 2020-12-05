class CommentsController < ApplicationController
  before_action :require_user_logged_in

  def new
    @board = Board.find(params[:board_id])
    @comment = current_user.comments.build
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.board_id = params[:board_id]
    if @comment.save
      flash[:success] = 'コメントを投稿しました。'
      redirect_to board_url(params[:board_id])
    else
      if @comment.content.blank?
        flash.now[:danger] = '1文字以上入力して下さい'
      else
        flash.now[:danger] = 'コメントの投稿に失敗しました。'
      end
      @board = Board.find(params[:board_id])
      render :new
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    
    flash[:success] = 'コメントは正常に削除されました'
    redirect_to board_url(params[:board_id])
  end
  
  
  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end
end
