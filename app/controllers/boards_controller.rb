class BoardsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create]

  def index
    @boards = Board.order(id: :desc).page(params[:page]).per(28)
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      flash[:success] = '掲示板を作成しました。'
      redirect_to boards_url
    else
      flash.now[:danger] = '掲示板の作成に失敗しました。'
      render :new
    end
  end

  def new
    @board = current_user.boards.build
  end

  def show
  end
  
  
  private
  
  def board_params
    params.permit(:book_thumbnail_link, :book_title, :book_author)
  end
end
