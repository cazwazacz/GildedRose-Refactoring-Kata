class ItemSorter

  def initialize(aged_brie)
    @aged_brie = aged_brie
    @items = {
      "Aged Brie": lambda { |item| @aged_brie.update_quality(item) }
    }
  end

  def sort_and_update(item)
    @items[item.name.to_sym].call(item)
  end

end
