# == Schema Information
#
# Table name: companies
#
#  id          :bigint           not null, primary key
#  address     :string
#  description :text
#  email       :string
#  name        :string
#  phone       :string
#  website     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tenant_id   :integer          not null
#  user_id     :integer          not null
#
class Company < ApplicationRecord
  belongs_to :tenant
  belongs_to :user
  has_many :contacts
  has_many :forms
  has_many :notes
  has_many :tasks
  has_many :project_companies
  has_many :projects, through: :project_companies
  has_many :company_company_groups
  has_many :groups, through: :company_company_groups, source: :company_group
  # TODO: link events
  default_scope -> { order(:name) }
  decorate_with CompanyDecorator

  #
  # TODO: do MTI and stuff for the values. This will not scale safely beyond only companies.
  #
  has_many :custom_values, class_name: 'Value', foreign_key: :linked_record_id

  accepts_nested_attributes_for :custom_values

  def custom_fields
    tenant.company_fields
  end

  def build_custom_values
    existing_fields = custom_values.map(&:field_id)

    custom_fields.each do |field|
      unless existing_fields.include? field.id
        custom_values.build field_id: field.id
      end
    end

    custom_values
  end

  def custom_values_attributes=(attributes)
    list = Hash[attributes.values.map { |attr| [attr['field_id'].to_i, attr['value']] }]

    custom_values.each do |cv|
      new_value = list[cv.field_id]
      if new_value.present?
        cv.value = new_value
      else
        cv.delete
      end
    end
  end
end
