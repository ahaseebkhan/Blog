class CommentsController < ApplicationController
  include ActionView::RecordIdentifier
  include RecordHelper

  before_action :set_comment
  before_action :authorize_comment

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(dom_id_for_records(@comment, prefix: 'container'),
                                                    partial: "comments/comment", 
                                                    locals: { comment: @comment, commentable: @comment.commentable })
        end
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(dom_id_for_records(@comment), 
                                                    partial: "comments/form", 
                                                    locals: { comment: @comment, data: { form_target: "edit" } })
        end
      end
    end
  end

  def destroy
    # Add support for toast/flash later on to show error messages
    @comment.destroy
    redirect_to posts_path
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def authorize_comment
    authorize @comment
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
