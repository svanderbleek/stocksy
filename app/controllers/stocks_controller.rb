class StocksController < ApplicationController
  before_action :set_stock, only: [:destroy]

  def index
    @stocks = Stock.all
  end

  def create
    @stock = Stock.new_for_default_portfolio(stock_params)

    if @stock.save
      redirect_to stocks_url
    else
      redirect_to stocks_url, notice: @stock.errors.map {|k,v| "#{k} #{v}"}.join(',') + '.'
    end
  end

  def destroy
    @stock.destroy
    redirect_to stocks_url
  end

  private

  def set_stock
    @stock = Stock.find(params[:id])
  end

  def stock_params
    params.require(:stock).permit(:symbol, :shares)
  end
end
