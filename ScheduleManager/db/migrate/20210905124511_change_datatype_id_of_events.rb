class ChangeDatatypeIdOfEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :id, :string
  end
end
