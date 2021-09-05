class ChangeDatatypeEventIdOfEventJoinStatuses < ActiveRecord::Migration[5.2]
  def change
    change_column :event_join_statuses, :event_id, :string
  end
end
