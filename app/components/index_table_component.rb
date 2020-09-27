class IndexTableComponent < ViewComponent::Base
  def initialize(items, fields, row_classes: {}, sort_fields: [], q: nil, path_for: nil)
    @items = items
    @fields = fields
    @row_classes = row_classes
    @sort_fields = sort_fields
    @q = q
    @path_for = path_for if path_for.respond_to? :call
  end

  def should_sort?(field)
    @q.present? && @sort_fields.include?(field)
  end

  def item_path(item)
    if @path_for.present?
      @path_for.call(item)
    else
      polymorphic_path([item])
    end
  end
end
