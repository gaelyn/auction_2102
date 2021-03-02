require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/attendee'
require './lib/auction'

class AuctionTest < Minitest::Test

  def setup
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    @attendee2 = Attendee.new(name: 'Bob', budget: '$75')
    @attendee3 = Attendee.new(name: 'Mike', budget: '$100')
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

  def test_unpopular_items
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)

    assert_equal @auction.unpopular_items, [@item2, @item3, @item5]

    @item3.add_bid(@attendee2, 15)

    assert_equal @auction.unpopular_items, [@item2, @item5]
  end

  def test_it_can_find_potential_revenue
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)

    assert_equal 87, @auction.potential_revenue
  end

  def test_it_can_list_bidder_names
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    @item1.add_bid(@attendee1, 22)
    @item1.add_bid(@attendee2, 20)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)

    assert_equal @auction.bidders, ["Megan", "Bob", "Mike"]
  end

  def test_it_can_list_bidder_info
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    @item1.add_bid(@attendee1, 22)
    @item1.add_bid(@attendee2, 20)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)

    expected = {
      @attendee1 => {:budget => @attendee1.budget, :items => [@item1]},
      @attendee2 => {:budget => @attendee2.budget, :items => [@item1, @item4]},
      @attendee3 => {:budget => @attendee3.budget, :items => [@item3]},
    }

    assert_equal expected, @auction.bidder_info

  end
end
