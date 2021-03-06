require './lib/recipe'
require 'pry'
class Pantry
  attr_reader :stock, :shopping_list, :cookbook

  def initialize
    @stock = Hash.new(0)
    @shopping_list = {}
    @cookbook = {}
  end


  def stock_check(item)
    @stock[item]
  end

  def restock(item, quantity)
    @stock[item] += quantity
  end

  def add_to_shopping_list(recipe)
    recipe.ingredients.each do |key, value|
      if @shopping_list.keys.include?(key)
        @shopping_list[key]+= value
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

  def add_to_cookbook(recipe)
    @cookbook[recipe.name] = recipe.ingredients
  end

  def what_can_i_make?
    @cookbook.each do |key, value|
      value.each do |ingredient, amount|
        if stock_check(ingredient) > amount && ingredient =  @cookbook[key]
          puts cookbook[key]
        end
      end
    end
  end  
end
