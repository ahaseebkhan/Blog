class Groups::PostsController < ApplicationController
  before_action :set_group
  before_action :set_posts, :set_members, only: %i(index)

  def index; end

  def create
    post = @group.posts.new(creator: current_user)
    
    if post.update(post_params)
      redirect_to group_posts_path(@group)
    else
      render :index
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_posts
    @posts = @group.posts.left_outer_joins(:comments).select("posts.*, MAX(comments.updated_at) as last_activity").group('posts.id').order(created_at: :desc)
  end

  def set_members
    @members = @group.users
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end