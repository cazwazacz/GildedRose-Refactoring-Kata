class BackstagePass
  def self.update_quality(item)
    if item.sell_in <= 1
      item.quality = 0
    elsif item.sell_in <= 5
      item.quality = item.quality + 3
    elsif item.sell_in <= 10
      item.quality = item.quality + 2
    else
      item.quality = item.quality + 1
    end
    item.sell_in -= 1
  end
end
