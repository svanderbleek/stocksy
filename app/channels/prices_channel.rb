class PricesChannel < ApplicationCable::Channel
  def subscribed
    stream_from Portfolio.default_portfolio.prices
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
