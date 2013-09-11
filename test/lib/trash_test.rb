require "test_helper"

class TrashTest < MiniTest::Test
  def test_param_translation
    result = Result.new(firstName: "Bob")
    assert_equal "Bob", result.first_name

    result = Result.new
    assert_nil result.first_name
  end

  def test_transform_with_lambda
    result = Result.new(id: '123')
    assert_equal 123, result.id

    result.id = "123"
    assert_equal 123, result.id
  end
end