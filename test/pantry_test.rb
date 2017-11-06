require './lib/pantry'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test

  def test_it_exists
    pantry = Pantry.new

    assert_instance_of Pantry, pantry
  end

  def test_it_has_no_stock
    pantry = Pantry.new

    assert pantry.stock.empty?
  end

  def test_it_checks_stock_of_item
    pantry = Pantry.new

    assert_equal 0, pantry.stock_check("Cheese")
  end

  def test_it_checks_stock_of_another_item
    pantry = Pantry.new
    pantry.stock_check("Cheese")
    pantry.stock_check("Apples")

    assert_equal 0, pantry.stock_check("Apples")
  end

  def test_it_can_restock
    pantry = Pantry.new
    pantry.stock_check("Cheese")
    pantry.restock("Cheese", 10)

    assert_equal 10, pantry.stock_check("Cheese")
  end

  def test_it_can_add_quantity_to_restock
    pantry = Pantry.new
    pantry.restock("Cheese", 10)
    pantry.restock("Cheese", 20)

    assert_equal 30, pantry.stock_check("Cheese")
  end

  def test_it_can_add_to_shopping_list
    pantry = Pantry.new
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)

    assert_instance_of Hash , pantry.add_to_shopping_list(r)
  end
end
