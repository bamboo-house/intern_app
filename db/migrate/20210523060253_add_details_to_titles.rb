class AddDetailsToTitles < ActiveRecord::Migration[5.1]
  def change
    add_reference :scrapings, :reg_group, foreign_key: true
  end
end
