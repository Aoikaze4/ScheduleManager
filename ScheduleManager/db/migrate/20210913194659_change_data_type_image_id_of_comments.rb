class ChangeDataTypeImageIdOfComments < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :image_id, :string
  end
end
