# == Schema Information
#
# Table name: tag_assignments
#
#  id            :bigint           not null, primary key
#  taggable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  tag_id        :bigint
#  taggable_id   :bigint
#
# Indexes
#
#  index_tag_assignments_on_tag_id                         (tag_id)
#  index_tag_assignments_on_taggable_type_and_taggable_id  (taggable_type,taggable_id)
#
class TagAssignment < ApplicationRecord
  belongs_to :taggable, polymorphic: true
  belongs_to :tag
end
