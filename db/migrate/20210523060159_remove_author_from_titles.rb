class RemoveAuthorFromTitles < ActiveRecord::Migration[5.1]
  def change
    remove_column :scrapings, :reg_group_id, :integer
  end
end
