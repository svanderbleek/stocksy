require 'test_helper'

class PortfolioTest < ActiveSupport::TestCase
  test "has default" do
    assert Portfolio.default_portfolio
  end

  test "list of stocks" do
    assert Portfolio.default_portfolio.stocks.count == 2
  end
end
