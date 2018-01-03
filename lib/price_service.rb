require 'httparty'

class PriceService
  KEY = '6GCV80279I2N8Y5A'
  FUNCTION = 'TIME_SERIES_DAILY'
  INTERVAL = '1min'
  URL = "https://www.alphavantage.co/query?function=#{FUNCTION}&apikey=#{KEY}&symbol="
  PRICES = "Time Series (Daily)"
  PRICE = "4. close"

  def self.read(symbol)
    data = JSON.parse(HTTParty.get(URL + symbol).body)
    data[PRICES][Date.today.to_s][PRICE].to_f
  end
end
