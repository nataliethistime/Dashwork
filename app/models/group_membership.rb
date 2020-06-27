# == Schema Information
#
# Table name: group_memberships
#
#  id             :bigint           not null, primary key
#  groupable_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  group_id       :bigint
#  groupable_id   :bigint
#
# Indexes
#
#  index_group_memberships_on_group_id                         (group_id)
#  index_group_memberships_on_groupable_type_and_groupable_id  (groupable_type,groupable_id)
#
class GroupMembership < ApplicationRecord
  belongs_to :groupable, polymorphic: true
  belongs_to :group
end
