require 'pry'
class Pantry
  attr_reader :stock, :quantity

  def initialize
    @stock = {}
    @quantity = 0
  end

  def stock_check(item)
    @stock[item] = quantity
  end


  def restock(item, quantity)
    binding.pry
    if stock.keys.include?(item)
    @stock[item] += quantity
    binding.pry
    end
  end
end
