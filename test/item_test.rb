require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'

class ItemTest < Minitest::Test

  def setup
    @item1 = Item.new('Chalkware Piggy Bank')
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
end
