module ApplicationHelper
  def current_tenant
    current_user&.tenant
  end

  def icon_for(name)
    icon = EnvSettings.icons[name.to_s]
    tag.i class: icon if icon.present?
  end

  def attributes_table(model, list)
    render 'common/attributes_table', attributes: decorate_items(model, list)
  end

  def decorate_items(model, list)
    attributes = {}

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
          Array(values).each do |val|
            attributes["#{key} #{val}".humanize] = sub_model.decorate val
          end
        end
      else
        attributes[item.to_s.humanize] = model.decorate item
      end
    end

    attributes
  end
end
