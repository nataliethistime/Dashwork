module ApplicationHelper
  def actions_dropdown(icon, items)
    render 'common/actions_dropdown', icon: icon, items: items
  end

  def icon_for(name)
    icon = EnvSettings.icons[name.to_s]
    tag.span class: 'icon' do
      tag.i class: icon if icon.present?
    end
  end

  def class_names(names)
    classes = []
    names.each { |key, value| classes << key if value == true }
    classes.join ' '
  end
end
