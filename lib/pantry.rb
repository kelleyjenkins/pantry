require './lib/recipe'
require 'pry'
class Pantry
  attr_reader :stock, :shopping_list

  def initialize
    @stock = Hash.new(0)
    @shopping_list = {}
  end


  def stock_check(item)
    @stock[item]
  end

  def restock(item, quantity)
    @stock[item] += quantity
  end

  def add_to_shopping_list(recipe)
    recipe.ingredients.each do |key, value|
      @shopping_list[key] = value
      if @recipe.keys.include?(recipe.ingredients)
        @shopping_list[key] += value
      else
      @shopping_list[key] = value
      end
    end
  end

  def print_shopping_list
    @shopping_list.each do |key, value|
      puts "#{key}: #{value}"
    end
  end

end
