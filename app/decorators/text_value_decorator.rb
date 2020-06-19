class TextValueDecorator < DecoratorBase
  def value(text_value)
    format text_value.value, as: :markdown
  end
end
