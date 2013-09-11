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

  def test_mash_set_name
    @mash.name = "John"
    assert_equal "John", @mash.name
  end

  def test_mash_key_exist
    @mash.name = "John"
    assert @mash.name?
  end

  def test_bang_do_submash
    @mash.author!.name = "John"
    assert_equal "John", @mash.author.name
  end
end