class ChangeDataTypeEventIdOfComments < ActiveRecord::Migration[5.2]
  def change
    change_column :Comments, :event_id, :string
    change_column :event_images, :event_id, :string
  end
end
