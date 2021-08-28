class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :user_id
      t.timestamp :event_at
      t.string :event_name
      t.text :description

      t.timestamps
    end
  end
end
