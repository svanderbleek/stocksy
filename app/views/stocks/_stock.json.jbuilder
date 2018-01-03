json.extract! stock, :id, :portfolio_id, :symbol, :shares, :price, :last_price, :created_at, :updated_at
json.url stock_url(stock, format: :json)
