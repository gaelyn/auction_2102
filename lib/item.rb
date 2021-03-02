class Item
  attr_reader :name,
              :bids
  def initialize(name)
    @name = name
    @bids = Hash.new
  end

  def add_bid(attendee, bid_amount)
    @bids[attendee] = bid_amount
  end

  def current_high_bid
    @bids.values.max
  end

  def list_bidder_names
    bids.map do |bidder, amount|
      bidder.name
    end
  end
end
