class CreateRegGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :reg_groups do |t|
      t.string :group_name

      t.timestamps
    end
  end
end
