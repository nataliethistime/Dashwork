class RenameGroupsToTags < ActiveRecord::Migration[6.0]
  def change
    rename_table :group_memberships, :tag_assignments
    rename_column :tag_assignments, :groupable_id, :taggable_id
    rename_column :tag_assignments, :groupable_type, :taggable_type
    rename_column :tag_assignments, :group_id, :tag_id

    rename_table :groups, :tags
  end
end
