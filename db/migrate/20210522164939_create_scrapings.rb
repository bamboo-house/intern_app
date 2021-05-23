class CreateScrapings < ActiveRecord::Migration[5.1]
  def change
    create_table :scrapings do |t|
      t.string :group_name
      t.string :event_title
      t.string :link_url

      t.timestamps
    end
  end
end
