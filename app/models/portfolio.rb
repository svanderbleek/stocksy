require 'price_service'

class Portfolio < ApplicationRecord
  has_many :stocks

  def self.default_portfolio
    first
  end

  def prices
    stocks.map {|stock| PriceService.read(stock.symbol)}
  end
end
