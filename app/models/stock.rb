class Stock < ApplicationRecord
  belongs_to :portfolio

  validates :symbol, presence: true

  def self.new_for_default_portfolio(stock_params)
    Stock.new(stock_params.merge(portfolio: Portfolio.default_portfolio))
  end

  def value(none:)
    if price? && shares?
      price * shares
    else
      none
    end
  end

  def trend(up:, down:, none:)
    if price? && last_price?
      if price < last_price
        down
      elsif last_price < price
        up
      end
    end
    none
  end
end
