require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "quality degrades twice as fast after sell_in date has passed" do
      items = [Item.new("junk", 0, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 8
    end

    it "quality is never negative" do
      items = [Item.new("junk", 5, 5)]
      10.times { GildedRose.new(items).update_quality() }
      expect(items[0].quality).to eq 0
    end

    it "quality of Aged Brie increases with time" do
      items = [Item.new("Aged Brie", 10, 2)]
      5.times { GildedRose.new(items).update_quality() }
      expect(items[0].quality).to eq 7
    end

    it "quality of an item can never increase above 50" do
      items = [Item.new("Aged Brie", 10, 48)]
      5.times { GildedRose.new(items).update_quality() }
      expect(items[0].quality).to eq 50
    end

    it "the sell_in value of Sulfuras never decreases" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 80)]
      5.times { GildedRose.new(items).update_quality() }
      expect(items[0].sell_in).to eq 0
    end

    it "the quality of Sulfuras never changes" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 80)]
      5.times { GildedRose.new(items).update_quality() }
      expect(items[0].quality).to eq 80
    end
  end

end
