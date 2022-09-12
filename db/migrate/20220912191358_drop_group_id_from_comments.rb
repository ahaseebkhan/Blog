class DropGroupIdFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :group_id
  end
end
