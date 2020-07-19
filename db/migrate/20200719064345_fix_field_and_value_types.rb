class FixFieldAndValueTypes < ActiveRecord::Migration[6.0]
  def up
    CustomField.inheritance_column = nil
    CustomValue.inheritance_column = nil

    CustomField.all.map do |field|
      field.type = "Custom#{field.type}"
      field.save validate: false
      field
    end

    CustomField.all.map do |field|
      field.domain = "Custom#{field.domain}"
      field.save validate: false
      field
    end

    CustomValue.all.map do |value|
      value.type = "Custom#{value.type}"
      value.save validate: false
      value
    end
  end
end
