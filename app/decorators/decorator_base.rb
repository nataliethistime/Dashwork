module DecoratorBase
  def helpers
    ApplicationController.helpers
  end

  def clean_url(url)
    url.gsub(/https?:\/\//, '')
  end
end
