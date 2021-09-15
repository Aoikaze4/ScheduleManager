class EventImagesDelete < ActiveRecord::Migration[5.2]
  def change
    drop_table :event_images
  end
end
