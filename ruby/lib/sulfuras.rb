class Sulfuras
  def self.update_quality(item)
    if item.quality < 50
      item.quality = item.quality + 1
    end
  end
end
