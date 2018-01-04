class GildedRose
  def initialize(items, item_sorter, aged_brie, sulfuras, backstage_pass, conjured)
    @items = items
    @item_sorter = item_sorter.new(aged_brie, sulfuras, backstage_pass, conjured)
  end

  def update_quality
    @items.each do |item|
      @item_sorter.sort_and_update(item)
    end
  end
end
