class ItemSorter

  def initialize(aged_brie)
    @aged_brie = aged_brie
    @items = {
      "Aged Brie": @aged_brie.update_quality
    }
  end

  def sort_and_update(arg)
    @items[arg.to_sym]
  end

end
