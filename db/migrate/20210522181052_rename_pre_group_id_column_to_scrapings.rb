class RenamePreGroupIdColumnToScrapings < ActiveRecord::Migration[5.1]
  def change
    rename_column :scrapings, :pre_group_id, :reg_group_id
  end
end
