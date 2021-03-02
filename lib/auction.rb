class Auction
  attr_reader :items
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    @items.select do |item|
      item.bids.empty?
    end
  end

  def potential_revenue
    @items.map do |item|
      item.current_high_bid
    end.compact.sum
  end

  def bidders
    @items.flat_map do |item|
      item.list_bidder_names
    end.uniq
  end

  def bidder_info
    info_hash = {}
    @items.each do |item|
      item.bids.keys.each do |bidder|
        # require "pry"; binding.pry
        info_hash[bidder.name] = {:budget => bidder.budget, :items => []}
      end
    end

    info_hash.each do |name, values|
      require "pry"; binding.pry
    end


  end
end
