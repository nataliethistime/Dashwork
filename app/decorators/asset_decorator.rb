class AssetDecorator < DecoratorBase
  def description(asset)
    format asset.description, as: :markdown
  end

  def purchase_date(asset)
    format asset.purchase_date, as: :date
  end

  def warranty_date(asset)
    format asset.warranty_date, as: :date
  end

  def purchase_price(asset)
    format asset.purchase_price, as: :currency
  end
end
