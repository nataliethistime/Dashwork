class PriorityInput < SimpleForm::Inputs::PriorityInput
  def input(wrapper_options)
    template.content_tag(:div, super, class: 'select is-fullwidth')
  end
end
