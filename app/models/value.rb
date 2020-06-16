# == Schema Information
#
# Table name: values
#
#  id               :bigint           not null, primary key
#  boolean_entity   :boolean
#  date_entity      :date
#  datetime_entity  :datetime
#  float_entity     :float
#  integer_entity   :integer
#  string_entity    :string
#  text_entity      :text
#  time_entity      :time
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  field_id         :bigint
#  linked_record_id :bigint
#
# Indexes
#
#  index_values_on_field_id  (field_id)
#
class Value < ApplicationRecord
  decorate_with ValueDecorator

  belongs_to :field

  def value
    case field.type # TODO: I think this is bad
    when 'string'
      string_entity
    end
  end

  def value=(new_value)
    case field.type # TODO: fuck this off
    when 'string'
      string_entity = new_value
    end
  end
end
