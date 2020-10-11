class CreateWikiFolders < ActiveRecord::Migration[6.0]
  def change
    create_table :wiki_folders do |t|
      t.string :name
      t.bigint :parent_id
      t.belongs_to :tenant
      t.timestamps
    end
  end
end
