require 'typhoeus'

class PriceService
  KEY = ENV['STOCKSY_KEY']
  FUNCTION = 'TIME_SERIES_DAILY'
  INTERVAL = '1min'
  URL = "https://www.alphavantage.co/query?function=#{FUNCTION}&apikey=#{KEY}&symbol="
  PRICES = "Time Series (Daily)"
  PRICE = "4. close"

  def initialize(portfolio)
    @hydra = Typhoeus::Hydra.new
    request_prices(portfolio)
  end

  private

  def request_prices(portfolio)
    portfolio.stocks.each do |stock|
      @hydra.queue(price_request(stock))
    end
    @hydra.run
  end

  def price_request(stock)
    request = Typhoeus::Request.new(URL + stock.symbol)
    request.on_complete do |response|
      data = JSON.parse(response.body)
      price = data[PRICES][Date.today.to_s][PRICE].to_f
      stock.update(
        price: price,
        last_price: stock.price
      )
    end
    request
  end
end
