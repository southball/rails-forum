class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @comment = Comment.new(
      body: comment_params[:body],
      post: Post.find_by_id(comment_params[:post]),
      author: current_user
    )
    if @comment.save
      redirect_to @comment.post
    else
      redirect_to @comment.post, flash: { alert: "Failed to save comment. Please try again." }
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:post, :body)
    end
end
