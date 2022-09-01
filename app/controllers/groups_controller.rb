class GroupsController < ApplicationController
  before_action :set_group, only: %i(join leave show update)

  def index
    @group = Group.new
    @joined_group_ids = current_user.group_users.pluck(:group_id)

    if params[:scope]
      @groups = Group.with_stats.send(params[:scope], current_user.id)
    else
      @groups = Group.with_stats
    end
  end

  def create
    @group = Group.new(group_params)

    if @group.update(creator: current_user)
      redirect_to groups_path, notice: 'Group was successfully created.'
    else
      render turbo_stream: turbo_stream.replace('group_form', partial: "groups/form")
    end
  end

  def update
    authorize @group

    if @group.update(group_params)
      redirect_to group_path(@group), notice: 'Group was successfully updated.'
    else
      render turbo_stream: turbo_stream.replace('group_form', partial: "groups/form")
    end
  end

  def join
    group_user = GroupUser.find_or_initialize_by(user: current_user, group_id: params[:group_id])
    
    if group_user.save
      redirect_to groups_path
    else
      redirect_to groups_path, alert: group_user.errors.full_messages.first
    end
  end

  def leave
    GroupUser.where(user: current_user, group_id: params[:group_id]).destroy_all
    redirect_to groups_path
  end

  private

  def set_group
    @group = Group.find(params[:group_id] || params[:id])
  end

  def group_params
    params.require(:group).permit(:name)
  end
end
