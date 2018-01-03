class PricesChannel < ApplicationCable::Channel
  def subscribed
    stream_from Portfolio.default_channel
  end
end
