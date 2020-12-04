class CommentsController < ApplicationController
  before_action :require_user_logged_in

  def new
    @board = Board.find(params[:board_id])
    @comment = @board.comments.build
  end

  def create
    @comment = Board.find(params[:board_id]).comments.build(content: comment_params, user_id: current_user.id)
    if @comment.save
      flash[:success] = 'コメントを投稿しました。'
      redirect_to board_url(params[:board_id])
    else
      flash.now[:danger] = 'コメントの投稿に失敗しました。'
      render 'comments/new'
    end
  end

  def destroy
  end
  
  
  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end
end
