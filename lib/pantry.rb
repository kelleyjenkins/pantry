require 'pry'
class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
    @start_quantity = 0
  end

  def stock_check(item)
    @stock[item] = @start_quantity
  end

  def restock(item, quantity)
    if @stock.keys.include?(item)
      @stock[item] += quantity
    end
  end
end
