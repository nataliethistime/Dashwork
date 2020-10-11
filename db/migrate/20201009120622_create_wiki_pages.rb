class CreateWikiPages < ActiveRecord::Migration[6.0]
  def change
    create_table :wiki_pages do |t|
      t.string :title
      t.text :content
      t.belongs_to :folder
      t.timestamps
    end
  end
end
