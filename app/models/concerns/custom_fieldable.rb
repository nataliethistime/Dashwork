module CustomFieldable
  extend ActiveSupport::Concern

  included do
    has_many :custom_values, as: :custom_fieldable, dependent: :destroy
    accepts_nested_attributes_for :custom_values
  end

  def custom_fields
    tenant.public_send "custom_#{self.model_name.singular}_fields"
  end

  def build_custom_values
    existing_fields = custom_values.map(&:custom_field_id)

    custom_fields.each do |field|
      unless existing_fields.include? field.id
        custom_values.build custom_field_id: field.id, type: field.type
      end
    end

    custom_values
  end

  def custom_values_attributes=(attributes)
    list = Hash[attributes.values.map { |attr| [attr['custom_field_id'].to_s, attr['value']] }]

    build_custom_values.each do |cv|
      new_value = list[cv.custom_field_id.to_s]
      if new_value.present?
        cv.value = new_value
      else
        cv.delete
      end
    end
  end
end
