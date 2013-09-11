require "test_helper"

class DashTest < MiniTest::Test
  def test_fail_init_without_required
    assert_raises(ArgumentError) { Person.new }
  end

  def test_success_init
    p = Person.new(name: "Bob")
    assert_equal "Bob", p.name
    p0 = Person.new(name: "John")
  end

  def test_property_set
    p = Person.new(name: "Bob")
    p.name = "John"
    assert_equal "John", p.name
  end
end