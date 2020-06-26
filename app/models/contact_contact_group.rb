# == Schema Information
#
# Table name: contact_contact_groups
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  contact_group_id :bigint
#  contact_id       :bigint
#
# Indexes
#
#  index_contact_contact_groups_on_contact_group_id  (contact_group_id)
#  index_contact_contact_groups_on_contact_id        (contact_id)
#
class ContactContactGroup < ApplicationRecord
  belongs_to :contact
  belongs_to :contact_group
end
