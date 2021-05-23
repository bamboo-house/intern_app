class AddGroupIdToScrapings < ActiveRecord::Migration[5.1]
  def change
    add_column :scrapings, :group_id, :integer, after: :id
  end
end
