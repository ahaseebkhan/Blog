class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, size: :long
      t.references :creator, foreign_key: { to_table: :users }, index: true
      t.belongs_to :group, foreign_key: true, index: true
      t.timestamps
    end
  end
end
