class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :body, size: :long
      t.belongs_to :user, foreign_key: true, index: true
      t.belongs_to :group, foreign_key: true, index: true
      t.references :commentable, polymorphic: true
      t.timestamps
    end
  end
end
