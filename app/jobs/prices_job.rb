class PricesJob < ApplicationJob
  queue_as :default

  def perform
    portfolio = Portfolio.default_portfolio
    PriceService.new(portfolio)
    portfolio.reload
    stocks_html = ApplicationController.render(
      partial: "stocks/table",
      assigns: {stocks: portfolio.stocks}
    )
    ActionCable.server.broadcast(Portfolio.default_channel, stocks_html)
    PricesJob.set(wait: 5.seconds).perform_later
  end
end
