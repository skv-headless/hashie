require "test_helper"

class TrashTest < MiniTest::Test
  def test_param_translation
    result = Result.new(firstName: "Bob")
    assert_equal "Bob", result.first_name
  end
end