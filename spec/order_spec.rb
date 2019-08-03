require 'order'

describe Order do

  let(:burger) { double("burger", name: "burger", price: 15) }
  let(:pasta) { double("pasta", name: "pasta", price: 10) }
  let(:sushi) { double("sushi", name: "sushi", price: 22) }
  let(:menu) { double("menu", :dishes_list => [burger, pasta]) }
  let(:items) { double("order_items", :list => { "burger" => 2, "pasta" =>1 }) }
  let(:restaurant) { double("restaurant", menu: menu) }

  subject { Order.new(restaurant, items) }

  describe "#checkout" do
    it "calls lock on the items" do
      allow(items).to receive(:lock)
      subject.checkout
      expect(items).to have_received(:lock)
    end
  end

  describe "#checked_out?" do
    it "returns false when order isn't closed" do
      expect(subject).not_to be_checked_out
    end

    it "returns true when order is closed" do
      allow(items).to receive(:lock)
      subject.checkout
      expect(subject).to be_checked_out
    end
  end 
    

#   describe "#add" do
#     it "adds an item to the order" do
#       subject.add(burger, 1)
#       expect(subject.items).to eq({ "burger" => 1 })
#     end

#     it "can add any number of an item" do
#       subject.add(pasta, 3)
#       expect(subject.items).to eq({ "pasta" => 3 })
#     end

#     it "increases the number of items of a same type" do
#       subject.add(burger, 2)
#       subject.add(pasta, 1)
#       subject.add(burger, 1)
#       expect(subject.items).to eq({ "burger" => 3, "pasta" => 1 })
#     end

#     it "raises an error if dish not on the restaurant's menu" do
#       expect { subject.add(sushi, 2) }.to raise_error "This dish is not available"
#     end

#     it "raises an error if the order is closed" do
#       subject.close
#       expect { subject.add(burger, 1) }.to raise_error "This order is closed"
#     end
#   end

#   describe '#remove' do
#     it 'removes an item from the order' do
#       subject.add(burger, 3)
#       subject.remove(burger, 1)
#       expect(subject.items).to eq({ "burger" => 2 })
#     end

#     it 'can remove several items of a kind at once' do
#       subject.add(burger, 3)
#       subject.remove(burger, 2)
#       expect(subject.items).to eq({ "burger" => 1 })
#     end

#     it "removes the entry if number of items <= 0" do
#       subject.add(burger, 3)
#       subject.remove(burger, 3)
#       expect(subject.items).to eq({})
#     end

#     it "raises an error if entry not in items" do
#       expect { subject.remove(burger, 1) }.to raise_error "No burger currently in order"
#     end

#     it 'raises an error if the order is closed' do
#       subject.close
#       expect { subject.remove(burger, 2) }.to raise_error "This order is closed"
#     end
#   end

#   describe '#items' do

#   end

#   describe '#close' do
#     it "closes the order" do
#       subject.close
#       expect(subject).to be_closed
#     end
#   end

#   describe '#total_price' do
    
#   end

#   describe '#time' do
    
#   end
end
