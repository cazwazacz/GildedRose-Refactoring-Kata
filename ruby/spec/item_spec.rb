require File.join(File.dirname(__FILE__), '../lib/item')

describe Item do
  let(:subject) { described_class.new("Junk", 10, 30) }

  describe "#initialize" do
    it "has a name" do
      expect(subject.name).to eq "Junk"
    end

    it "has a sell in date" do
      expect(subject.sell_in).to eq 10
    end

    it "has a quality" do
      expect(subject.quality).to eq 30
    end
  end
end
