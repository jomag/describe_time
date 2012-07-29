require 'test/unit'
require 'describe_time'

class TimeOrDateTest < Test::Unit::TestCase
  def test_same_date_should_return_only_time
    t1 = Time.local(2012,06,20,16,45)
    t2 = Time.local(2012,06,20,23,41)
    assert_equal '16:45', DescribeTime.time_or_date(t1, t2)
  end

  def test_different_dates_should_return_only_date
    t1 = Time.local(2012,06,23,13,41)
    t2 = Time.local(2012,06,24,15,23)
    assert_equal '2012-06-23', DescribeTime.time_or_date(t1, t2)
  end
end
