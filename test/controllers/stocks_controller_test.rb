require 'test_helper'

class StocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stock = stocks(:one)
  end

  test "should get index" do
    get stocks_url
    assert_response :success
  end

  test "should create stock" do
    assert_difference('Stock.count') do
      post(
        stocks_url,
        params: {
          stock: {
            symbol: @stock.symbol,
            shares: @stock.shares
          }
        }
      )
    end

    assert_redirected_to stocks_url
  end

  test "should destroy stock" do
    assert_difference('Stock.count', -1) do
      delete stock_url(@stock)
    end

    assert_redirected_to stocks_url
  end
end
