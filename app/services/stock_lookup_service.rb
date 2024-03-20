class StockLookupService
  # def self.new_lookup(name)
  #   results = Alphavantage::TimeSeries.search(keywords: name)
  #   return nil if results.blank?

  #   ticker = results.first.symbol
  #   company_name = results.first.name
  #   stock = Alphavantage::TimeSeries.new(symbol: ticker).quote
  #   previous_close = stock.previous_close

  #   { ticker: ticker, name: company_name, last_price: previous_close }
  # rescue => exception
  #   Rails.logger.error("StockLookupService.new_lookup failed: #{exception.message}")
  #   nil
  # end


  def self.new_lookup(ticker)
    result = POLYGON_CLIENT.single_daily(ticker, Time.now - 200000)
    return nil if result.blank?

    last_price = result['close']
    status = result['status']

    { ticker: ticker, last_price: last_price, status: status }
  rescue => exception
    Rails.logger.error("StockLookupService.new_lookup failed: #{exception.message}")
    nil
  end

end
  