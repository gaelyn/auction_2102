require 'minitest/autorun'
require 'minitest/pride'
require './lib/attendee'
require './lib/item'

class AttendeeTest < Minitest::Test

  def setup
    @attendee = Attendee.new(name: 'Megan', budget: '$50')
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end

  def test_it_exists
    assert_instance_of Attendee, @attendee
  end

  def test_it_has_attributes
    assert_equal "Megan", @attendee.name
    assert_equal 50, @attendee.budget
  end
end
