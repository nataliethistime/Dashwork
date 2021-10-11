# == Schema Information
#
# Table name: custom_values
#
#  id                    :integer          not null, primary key
#  boolean_entity        :boolean
#  custom_fieldable_type :string
#  date_entity           :date
#  datetime_entity       :datetime
#  float_entity          :float
#  integer_entity        :integer
#  string_entity         :string
#  text_entity           :text
#  time_entity           :time
#  type                  :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  custom_field_id       :bigint
#  custom_fieldable_id   :bigint
#
# Indexes
#
#  index_custom_values_on_custom_field_id  (custom_field_id)
#
class CustomTextValue < CustomValue
  decorate_with TextValueDecorator
  validates :text_entity, presence: true

  def value
    text_entity
  end

  def value=(new_value)
    self.text_entity = new_value
  end

  def form_field_type
    'text'
  end
end
