class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :image_id
      t.string :comment

      t.timestamps
    end
  end
end
