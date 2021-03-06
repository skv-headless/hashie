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

  def test_simple_nested_clash
    @clash.where!.abc('def').ghi(123).asd!.qwe("qwe")
    i_want = {:where => {:abc => 'def', :ghi => 123, :asd => {:qwe => "qwe"}}}
    assert_equal i_want, @clash.to_hash
  end

  def test_nested_clash
    @clash.where!.abc('def').ghi(123)._end!.order(:created_at)
    i_want = {:where => {:abc => 'def', :ghi => 123}, :order => :created_at}
    assert_equal i_want, @clash.to_hash
  end

  def test_nested_clash_jana
    @clash.first_level!.second_level!._end!._end!.root('root')
    i_want = {:first_level => {:second_level => {}}, :root => 'root'}
    assert_equal i_want, @clash.to_hash
  end
end