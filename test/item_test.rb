require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/attendee'

class ItemTest < Minitest::Test

  def setup
    @item1 = Item.new('Chalkware Piggy Bank')
    @attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    @attendee2 = Attendee.new(name: 'Bob', budget: '$75')
  end

  def test_it_exists
    assert_instance_of Item, @item1
  end

  def test_it_has_a_name
    assert_equal 'Chalkware Piggy Bank', @item1.name
  end

  def test_it_starts_with_no_bids
    assert_equal @item1.bids, {}
  end

  def test_it_can_add_bids
    @item1.add_bid(@attendee1, 22)
    assert_equal @item1.bids, {@attendee1 => 22}
  end

  def test_it_can_return_current_high_bid
    @item1.add_bid(@attendee1, 22)
    @item1.add_bid(@attendee2, 20)
    # require "pry"; binding.pry
    assert_equal @item1.current_high_bid, 22
  end
end
