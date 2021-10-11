# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tenant_id  :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_tags_on_tenant_id  (tenant_id)
#  index_tags_on_user_id    (user_id)
#
class ProjectTag < Tag
end
