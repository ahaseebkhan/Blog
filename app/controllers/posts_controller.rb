class PostsController < ApplicationController
  include ActionView::RecordIdentifier
  include RecordHelper

  before_action :set_post
  before_action :set_comments, only: :show

  def show; end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(dom_id_for_records(@post),
                                                    partial: "posts/post", 
                                                    locals: { post: @post })
        end
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(dom_id_for_records(@post), 
                                                    partial: "posts/form", 
                                                    locals: { post: @post })
        end
      end
    end
  end

  def destroy
    # Add support for toast/flash later on to show error messages
    @post.destroy
    redirect_to group_posts_path(@post.group)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_comments
    @comments = @post.comments.order(created_at: :desc)
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
