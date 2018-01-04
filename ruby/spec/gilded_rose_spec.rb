require File.join(File.dirname(__FILE__), '../lib/gilded_rose')

class ItemDouble
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end
end

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [ItemDouble.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "quality degrades twice as fast after sell_in date has passed" do
      items = [ItemDouble.new("junk", 0, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 8
    end

    it "quality is never negative" do
      items = [ItemDouble.new("junk", 5, 5)]
      10.times { GildedRose.new(items).update_quality() }
      expect(items[0].quality).to eq 0
    end

    it "quality of Aged Brie increases with time" do
      items = [ItemDouble.new("Aged Brie", 10, 2)]
      5.times { GildedRose.new(items).update_quality() }
      expect(items[0].quality).to eq 7
    end

    it "quality of an item can never increase above 50" do
      items = [ItemDouble.new("Aged Brie", 10, 48)]
      5.times { GildedRose.new(items).update_quality() }
      expect(items[0].quality).to eq 50
    end

    it "the sell_in value of Sulfuras never decreases" do
      items = [ItemDouble.new("Sulfuras, Hand of Ragnaros", 0, 80)]
      5.times { GildedRose.new(items).update_quality() }
      expect(items[0].sell_in).to eq 0
    end

    it "the quality of Sulfuras never changes" do
      items = [ItemDouble.new("Sulfuras, Hand of Ragnaros", 0, 80)]
      5.times { GildedRose.new(items).update_quality() }
      expect(items[0].quality).to eq 80
    end

    it "the quality of Backstage passes increases as time passes" do
      items = [ItemDouble.new("Backstage passes to a TAFKAL80ETC concert", 20, 30)]
      5.times { GildedRose.new(items).update_quality() }
      expect(items[0].quality).to eq 35
    end

    it "the quality of Backstage passes increases by 2 when there are 10 or less days left" do
      items = [ItemDouble.new("Backstage passes to a TAFKAL80ETC concert", 9, 30)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 32
    end

    it "the quality of Backstage passes increases by 3 when there are 5 or less days left" do
      items = [ItemDouble.new("Backstage passes to a TAFKAL80ETC concert", 4, 30)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 33
    end

    it "the quality of Backstage passes is zero when sell_in has passed" do
      items = [ItemDouble.new("Backstage passes to a TAFKAL80ETC concert", 2, 30)]
      5.times { GildedRose.new(items).update_quality() }
      expect(items[0].quality).to eq 0
    end

    it "the quality of Conjured items decreases twice as fast as normal items" do
      items = [ItemDouble.new("Conjured Mana Cake", 7, 20)]
      5.times { GildedRose.new(items).update_quality() }
      expect(items[0].quality).to eq 10
    end
  end

end
