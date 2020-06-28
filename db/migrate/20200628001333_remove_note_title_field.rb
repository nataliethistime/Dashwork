class RemoveNoteTitleField < ActiveRecord::Migration[6.0]
  def change
    remove_column :notes, :title
  end
end
