require "test_helper"

class MashTest < MiniTest::Test
  def setup
    @mash = Hashie::Mash.new
  end

  def test_mash_name_not_exist
    assert_equal false, @mash.name?
  end

  def test_mash_name_return_name
    assert_nil @mash.name
  end
end