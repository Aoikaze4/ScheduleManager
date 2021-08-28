class AddUserIdToEventImages < ActiveRecord::Migration[5.2]
  def change
    add_column :event_images, :user_id, :integer
  end
end
