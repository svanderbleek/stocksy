class PriceService
  KEY = '6GCV80279I2N8Y5A'
  FUNCTION = 'TIME_SERIES_INTRADAY'
  INTERVAL = '1min'
  URL = "https://www.alphavantage.co/query?function=#{FUNCTION}&interval=#{INTERVAL}&apikey=#{KEY}&symbol="

  def self.read(symbol)
    HTTParty.get(URL + symbol).body
  end
end
