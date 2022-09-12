class Groups::PostsController < ApplicationController
  before_action :set_group
  before_action :set_posts, :set_members, only: %i(index)

  def index; end

  def create
    post = @group.posts.new(creator: current_user)
    
    if post.update(post_params)
      redirect_to group_posts_path(@group)
    else
      redirect_to group_posts_path(@group), alert: post.errors.full_messages.first
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_posts
    @posts = @group.posts.with_last_activity
  end

  def set_members
    @members = @group.users
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end