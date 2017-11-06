require 'pry'
class Pantry
  attr_reader :stock, :quantity

  def initialize
    @stock = Hash.new(0)
  end


  def stock_check(item)
    @stock[item]
  end

  def restock(item, quantity)
    @stock[item] += quantity
  end
end
