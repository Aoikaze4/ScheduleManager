class EventImages < ActiveRecord::Migration[5.2]
  def down
    drop_table :event_images
  end
end
