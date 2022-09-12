class AddCommentIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :comment, index: true, foreign_key: true
    
    Comment.where(commentable_type: 'Comment').find_each do |comment|
      comment.update(comment_id: comment.commentable_id, commentable: find_commentable_root(comment.commentable))
    end
  end

  def find_commentable_root commentable
    return commentable if commentable.class != Comment
      
    find_commentable_root commentable.commentable
  end
end
