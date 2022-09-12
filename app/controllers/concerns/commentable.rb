module Commentable
  extend ActiveSupport::Concern
  include ActionView::RecordIdentifier
  include RecordHelper
  
  
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.comment = @parent
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.turbo_stream
        format.html { redirect_to @commentable }
      else
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace(dom_id_for_records(@parent || @commentable, @comment), partial: "comments/form", locals: { comment: @comment, commentable: (@parent || @commentable), data: { form_target: "new" } })
        }
        format.html { redirect_to @commentable }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
