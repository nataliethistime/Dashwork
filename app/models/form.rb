# == Schema Information
#
# Table name: forms
#
#  id                :bigint           not null, primary key
#  name              :string
#  status            :integer
#  user_id           :integer          not null
#  tenant_id         :integer          not null
#  form_template_id  :integer          not null
#  contact_id        :integer
#  equipment_id      :integer
#  project_id        :integer
#  calendar_event_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Form < ApplicationRecord
  belongs_to :tenant
  belongs_to :user
  belongs_to :form_template
  default_scope -> { order(:created_at) }
  decorate_with FormDecorator
end
