require 'price_service'

class Portfolio < ApplicationRecord
  has_many :stocks

  def self.default_portfolio
    first
  end

  def self.default_channel
    "portfolio:#{default_portfolio.id}"
  end
end
