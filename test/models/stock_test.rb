require 'test_helper'

class StockTest < ActiveSupport::TestCase
  test "trend up/down" do
    up_arrow = '^'
    down_arrow = 'v'

    up_trend = stocks(:one).trend(up: up_arrow, down: down_arrow)
    down_trend = stocks(:two).trend(up: up_arrow, down: down_arrow)
    no_trend = Stock.new.trend(up: up_arrow, down: down_arrow)

    assert up_trend == up_arrow
    assert down_trend == down_arrow
    assert no_trend.nil?
  end

  test "value" do
    assert stocks(:two).value == 6
    assert Stock.new.value.nil?
  end
end
