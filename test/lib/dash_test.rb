require "test_helper"

class DashTest < MiniTest::Test
  def setup
    @bob = Person.new(name: "Bob")
  end

  def test_fail_init_without_required
    assert_raises(ArgumentError) { Person.new }
  end

  def test_success_init
    p1 = Person.new(name: "John")
    assert_equal "Bob", @bob.name
    assert_equal "John", p1.name
  end

  def test_property_set
    @bob.name = "John"
    assert_equal "John", @bob.name
  end

  def test_property_access_by_symbol
    assert_equal 'Bob', @bob[:name]
  end

  def test_no_method_error
    assert_raises(NoMethodError) { @bob[:awesome] }
  end
end