# == Schema Information
#
# Table name: values
#
#  id                    :bigint           not null, primary key
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
#  custom_fieldable_id   :bigint
#  field_id              :bigint
#
# Indexes
#
#  index_values_on_field_id  (field_id)
#
class StringValue < Value
  decorate_with StringValueDecorator
  validates :string_entity, presence: true

  def value
    string_entity
  end

  def value=(new_value)
    self.string_entity = new_value
  end

  def form_field_type
    'string'
  end
end
