class SearchActionComponent < ViewComponent::Base
  attr_reader :path, :value, :query_param_name

  def initialize(path:, value:, query_param_name:)
    @path = path
    @value = value
    @query_param_name = query_param_name
  end
end
