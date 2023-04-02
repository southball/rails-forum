class BoardsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create]

  def index
    @boards = Board.all.sort_by(&:name)
  end

  def show
    @board = Board.find(params[:id])
    @posts = @board.posts.sort_by(&:created_at).reverse
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to @board
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private
    def board_params
      params.require(:board).permit(:name)
    end
end
