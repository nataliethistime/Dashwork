class DateTimeInput < SimpleForm::Inputs::DateTimeInput
  #
  # Instead of producing select boxes for day/month/year this makes simpleform generate 'html5'
  # browser-built-in date pickers.
  #
  def input_options
    options = super
    options[:html5] = true
    options
  end
end
