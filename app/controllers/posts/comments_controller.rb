class Posts::CommentsController < ApplicationController
  include Commentable

  before_action :set_commentable
  
  private

  def set_commentable
    @commentable = Post.find(params[:post_id])
  end

  def comments_params
    params.require(:post).permit(:title, :body)
  end
end
