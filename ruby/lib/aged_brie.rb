class AgedBrie
  def self.update_quality(item)
    if item.quality < 50
      item.quality = item.quality + 1
    end
    item.sell_in -= 1
  end
end
