class AttributesTableComponent < ViewComponent::Base
  def initialize(model, list, custom_values: false)
    @attributes = {}

    #
    # TODO: make this nicer
    # Possible solution: we could use decorators instead of this to handle getting stuff from linked items.
    # At this point I'm not sure whether we would want to use the linked item decorator or the parent item.
    # For instance, a company linked to a contact, do we want to use the company decorator to render
    # the company name or a decorator on the contact? Would there be differences? Do we want consistency instead?
    # Also this shit isn't even recursive. So more than one degree of sepration would break this.
    #
    list.each do |item|
      if item.instance_of? Hash
        item.each do |key, values|
          sub_model = model.public_send key
          next if sub_model.blank?

          Array(values).each do |val|
            @attributes[model.class.human_attribute_name("#{key}.#{val}")] = sub_model.decorate val
          end
        end
      else
        @attributes[model.class.human_attribute_name(item)] = model.decorate item
      end
    end

    if custom_values && model.respond_to?('custom_values')
      model.custom_values.includes(:field).each do |custom_value|
        @attributes[custom_value.field.name] = custom_value.decorate :value
      end
    end
  end
end
