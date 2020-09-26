class AddOpenToProject < ActiveRecord::Migration[6.0]
  def change
    change_table :projects do |t|
      t.string :status
    end
  end
end
