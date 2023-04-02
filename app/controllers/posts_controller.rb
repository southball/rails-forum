class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.sort_by(&:created_at)
  end

  def new
    @boards = Board.all
    @post = Post.new
  end

  def create
    params = post_params
    @boards = Board.all
    @post = Post.new(
      title: params[:title],
      body: params[:body],
      board: Board.find_by_id(params[:board]),
      author: current_user
    )
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def post_params
      params.require(:post).permit(:board, :title, :body)
    end
end
