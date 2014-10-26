class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string :title, null: false
      t.string :presenter, null: false
      t.string :presenter_link_text
      t.text :description
      t.text :info_links, null: false
      t.timestamps
    end
  end
end
