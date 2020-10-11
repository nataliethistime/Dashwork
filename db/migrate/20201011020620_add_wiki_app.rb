class AddWikiApp < ActiveRecord::Migration[6.0]
  def change
    add_column :tenants, :wiki_app, :boolean, default: false
  end
end
