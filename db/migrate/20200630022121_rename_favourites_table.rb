class RenameFavouritesTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :favourites, :stars
    rename_column :stars, :favouritable_id, :starrable_id
    rename_column :stars, :favouritable_type, :starrable_type
  end
end
