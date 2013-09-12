require "test_helper"

class ClashTest < MiniTest::Test
  def setup
    @clash = Hashie::Clash.new
  end

  def test_clash_init
    @clash.where(:abc => 'def').order(:created_at)
    i_want = {:where => {:abc => 'def'}, :order => :created_at}
    assert_equal i_want, @clash.to_hash
  end
end