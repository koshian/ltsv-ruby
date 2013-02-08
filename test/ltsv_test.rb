require 'test/unit'
require File.expand_path('../../lib/ltsv.rb', __FILE__)

class TC_LTSV < Test::Unit::TestCase
  def setup
    @ltsv = LTSV.new
  end

  def test_initialize
    @ltsv = LTSV.new(['label1', 'label2', 'label3'])
    assert_equal(['label1', 'label2', 'label3'], @ltsv.labels)
  end

  def test_bind
    @ltsv = LTSV.new(['label1', 'label2', 'label3'])
    @ltsv.bind(['data1', 'data2', 'data3'])
    assert_equal({'label1' => 'data1',
                  'label2' => 'data2',
                  'label3' => 'data3'}, @ltsv.hashed_line)
  end

  def test_to_string
    @ltsv = LTSV.new(['label1', 'label2', 'label3'])
    @ltsv.bind(['data1', 'data2', 'data3'])
    assert_equal("label1:data1\tlabel2:data2\tlabel3:data3", @ltsv.to_s)
  end

  def test_parse_line
    hash = LTSV.parse_line("label1:data1\tlabel2:data2\tlabel3:data3")
    assert_equal({'label1' => 'data1',
                  'label2' => 'data2',
                  'label3' => 'data3'}, hash)
  end
end
