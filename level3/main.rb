require "json"
require "date"
require 'minitest/autorun'

# require Level 1 code
require "../level1/import.rb"
require "../level1/export.rb"

require "../level1/base.rb"
require "../level1/car.rb"
require "../level1/rental.rb"

# require Level 2 code
require "../level2/numeric.rb"
require "../level2/rental.rb"

# require Level 3 code
require "../level3/rental.rb"

puts "Level3"

import_path = File.join(File.dirname(__FILE__), "data", "input.json")
export_path = File.join(File.dirname(__FILE__), "data", "output.json")

Car.import(import_path)
Rental.import(import_path)
Rental.export(export_path)

class Level3Test < MiniTest::Test
  # configuration methods
  def output_path
    File.join(File.dirname(__FILE__), "data", "output.json")
  end

  def expected_path
    File.join(File.dirname(__FILE__), "data", "expected_output.json")
  end

  def setup
    @expected = JSON.load(File.open(expected_path))
    @output = JSON.load(File.open(output_path))
  end

  def assert_equal_rentals_element(got, exp)
    assert_equal(got["id"], exp["id"])
    assert_equal(got["price"], exp["price"])
  end

  def assert_equal_fee_element(got, exp)
    assert_equal(got["insurance_fee"], exp["insurance_fee"])
    assert_equal(got["assistance_fee"], exp["assistance_fee"])
    assert_equal(got["drivy_fee"], exp["drivy_fee"])
  end

  # test methods
  def test_rentals_have_three_element
    exp = @expected["rentals"].count
    got = @output["rentals"].count

    assert_equal(got, exp)
  end

  def test_rentals_first_element
    exp = @expected["rentals"][0]
    got = @output["rentals"][0]

    assert_equal_rentals_element(got, exp)
    assert_equal_fee_element(got["commission"], exp["commission"])
  end

  def test_rentals_second_element
    exp = @expected["rentals"][1]
    got = @output["rentals"][1]

    assert_equal_rentals_element(got, exp)
    assert_equal_fee_element(got["commission"], exp["commission"])
  end

  def test_rentals_third_element
    exp = @expected["rentals"][2]
    got = @output["rentals"][2]

    assert_equal_rentals_element(got, exp)
    assert_equal_fee_element(got["commission"], exp["commission"])
  end
end
