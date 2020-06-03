class RemoveLanguage < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :language
  end
end
