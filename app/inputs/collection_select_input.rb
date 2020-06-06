class CollectionSelectInput < SimpleForm::Inputs::CollectionSelectInput
  def input(wrapper_options)
    template.content_tag(
      :div,
      super,
      class: "select is-fullwidth #{'is-multiple' if is_multiple?}"
    )
  end

  def is_multiple?
    input_options[:input_html][:multiple] rescue false
  end
end
