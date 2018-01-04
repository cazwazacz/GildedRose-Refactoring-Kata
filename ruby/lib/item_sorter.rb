class ItemSorter

  def initialize(aged_brie, sulfuras, backstage_pass)
    @aged_brie = aged_brie
    @sulfuras = sulfuras
    @backstage_pass = backstage_pass
    @items = {
      "Aged Brie": lambda { |item| @aged_brie.update_quality(item) },
      "Sulfuras, Hand of Ragnaros": lambda { |item| @sulfuras.update_quality(item) },
      "Backstage passes to a TAFKAL80ETC concert": lambda { |item| @backstage_pass.update_quality(item) }
    }
  end

  def sort_and_update(item)
    @items[item.name.to_sym].call(item)
  end

end
