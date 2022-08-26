class AddPronouns < ActiveRecord::Migration[6.0]
  def change
    change_table :contacts do |t|
      t.string :pronouns, null: true
    end
  end
end
