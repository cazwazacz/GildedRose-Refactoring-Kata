class ItemSorter

  def initialize(aged_brie, sulfuras, backstage_pass, conjured)
    @items = {
      "Aged Brie": lambda { |item| aged_brie.update_quality(item) },
      "Sulfuras, Hand of Ragnaros": lambda { |item| sulfuras.update_quality(item) },
      "Backstage passes to a TAFKAL80ETC concert": lambda { |item| backstage_pass.update_quality(item) },
      "Conjured Mana Cake": lambda { |item| conjured.update_quality(item) }
    }
  end

  def sort_and_update(item)
    special_item?(item) ? update_special_item(item) : update_regular_item(item)
  end

  private

  def special_item?(item)
    @items[item.name.to_sym]
  end

  def update_special_item(item)
    @items[item.name.to_sym].call(item)
  end

  def update_regular_item(item)
    if item.quality > 0
      if item.sell_in < 1
        item.quality = item.quality - 2
      else
        item.quality = item.quality - 1
      end
    end
    item.sell_in = item.sell_in - 1
  end

end
