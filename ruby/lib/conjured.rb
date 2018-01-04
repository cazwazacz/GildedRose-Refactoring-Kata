class Conjured
  def self.update_quality(item)
    if item.quality > 0
      if item.sell_in < 1
        item.quality = item.quality - 4
      else
        item.quality = item.quality - 2
      end
    end
    item.sell_in -= 1
  end
end
