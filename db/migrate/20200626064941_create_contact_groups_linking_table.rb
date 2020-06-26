class CreateContactGroupsLinkingTable < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_contact_groups do |t|
      t.belongs_to :contact
      t.belongs_to :contact_group
      t.timestamps
    end
  end
end
