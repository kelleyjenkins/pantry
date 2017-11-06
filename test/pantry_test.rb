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

    assert_equal 20, pantry.add_to_shopping_list(r)["Cheese"]
    assert_equal 2, pantry.shopping_list.count
  end

  def test_it_can_add_another_recipe_to_shopping_list
    pantry = Pantry.new
    r = Recipe.new("Cheese Pizza")
    r2 = Recipe.new("Spaghetti")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)
    r2.add_ingredient("Spaghetti Noodles", 10)
    r2.add_ingredient("Marinara Sauce", 10)
    r2.add_ingredient("Cheese", 5)
    pantry.add_to_shopping_list(r)
    pantry.add_to_shopping_list(r2)

    assert_equal 25, pantry.shopping_list["Cheese"]
    assert_equal 4, pantry.shopping_list.count
  end

  def test_it_can_print_to_console
    pantry = Pantry.new
    r = Recipe.new("Cheese Pizza")
    r2 = Recipe.new("Spaghetti")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)
    r2.add_ingredient("Spaghetti Noodles", 10)
    r2.add_ingredient("Marinara Sauce", 10)
    r2.add_ingredient("Cheese", 5)
    pantry.add_to_shopping_list(r)
    pantry.add_to_shopping_list(r2)

    assert pantry.print_shopping_list
  end

  def test_it_can_add_one_recipe_to_cookbook
    pantry = Pantry.new
    r1 = Recipe.new("Cheese Pizza")
    r1.add_ingredient("Cheese", 20)
    r1.add_ingredient("Flour", 20)
    pantry.add_to_cookbook(r1)

    assert_equal 1, pantry.cookbook.count
  end

  def test_it_can_add_another_recipe_to_cookbook
    pantry = Pantry.new
    r1 = Recipe.new("Cheese Pizza")
    r2 = Recipe.new("Pickles")
    r1.add_ingredient("Cheese", 20)
    r1.add_ingredient("Flour", 20)
    r2.add_ingredient("Brine", 10)
    r2.add_ingredient("Cucumbers", 30)
    pantry.add_to_cookbook(r1)
    pantry.add_to_cookbook(r2)

    assert_equal 10, pantry.cookbook["Pickles"]["Brine"]
    assert_equal 2, pantry.cookbook.count
  end

end
