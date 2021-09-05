class AddUserNameToEventJoinStatuses < ActiveRecord::Migration[5.2]
  def change
    add_column :event_join_statuses, :user_name, :string
  end
end
