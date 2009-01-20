require 'test_helper'

class LunchPeriodTest < ActiveSupport::TestCase

  test "to_s" do
    lunch_period = LunchPeriod.new(:name => "First Period",
                                   :begin_end_times => "12:00 pm - 12:20 pm")
    assert_equal "First Period [12:00 pm - 12:20 pm]", lunch_period.to_s
  end
  
end
