# == Schema Information
#
# Table name: fields
#
#  id         :bigint           not null, primary key
#  domain     :string
#  name       :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tenant_id  :bigint
#
# Indexes
#
#  index_fields_on_tenant_id  (tenant_id)
#
class Field < ApplicationRecord
  decorate_with FieldDecorator
end
