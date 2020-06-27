class CreateGroupMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :group_memberships do |t|
      t.references :groupable, polymorphic: true
      t.belongs_to :group
      t.timestamps
    end
  end
end
