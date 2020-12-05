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
      @board = Board.find(params[:board_id])
      @comment = @board.comments.build
      flash.now[:danger] = 'コメントの投稿に失敗しました。'
      render :new
    end
  end

  def destroy
  end
  
  
  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end
end
