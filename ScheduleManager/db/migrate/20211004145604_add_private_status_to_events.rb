class AddPrivateStatusToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :private_status, :integer
  end
end
