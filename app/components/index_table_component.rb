class IndexTableComponent < ViewComponent::Base
  def initialize(items, fields, row_classes: {}, sort_fields: [], q: nil)
    @items = items
    @fields = fields
    @row_classes = row_classes
    @sort_fields = sort_fields
    @q = q
  end

  def should_sort?(field)
    @q.present? && @sort_fields.include?(field)
  end
end
