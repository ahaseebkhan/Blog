class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.references :creator, foreign_key: { to_table: :users }, index: true
      t.timestamps
    end
  end
end
