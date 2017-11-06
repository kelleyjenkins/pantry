class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def add_item(item)
    @stock[item] = 0
  end

  def stock_check(item)
    @stock[item]
  end

  def restock(item, quantity)
    #  @stock[item] = item
    @stock[item] = quantity
  end
end
