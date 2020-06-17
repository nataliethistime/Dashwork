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
#  type             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  field_id         :bigint
#  linked_record_id :bigint
#
# Indexes
#
#  index_values_on_field_id  (field_id)
#
class StringValue < Value
  validates :string_entity, presence: true

  def value
    string_entity
  end

  def value=(new_value)
    self.string_entity = new_value
  end
end
