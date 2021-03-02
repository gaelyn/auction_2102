require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/attendee'
require './lib/auction'

class AuctionTest < Minitest::Test

  def setup
    @auction = Auction.new
    @attendee = Attendee.new(name: 'Megan', budget: '$50')
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end

  def test_it_exists
    assert_instance_of Auction, @auction
  end

  def test_it_starts_with_no_items
    assert_equal [], @auction.items
  end

  def test_it_can_add_items
    @auction.add_item(@item1)
    @auction.add_item(@item2)

    assert_equal [@item1, @item2], @auction.items
  end

  def test_it_can_list_item_names
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    assert_equal ["Chalkware Piggy Bank", "Bamboo Picture Frame"], @auction.item_names
  end
end
