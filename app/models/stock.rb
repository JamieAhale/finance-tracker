class Stock < ApplicationRecord

	def self.new_lookup(name)
		results = Alphavantage::TimeSeries.search(keywords: name)
		return nil if results.blank?
		ticker = results.first.symbol
		company_name = results.first.name
		stock =  Alphavantage::TimeSeries.new(symbol: ticker).quote
		previous_close = stock.previous_close

		begin
			@stock = new(ticker: ticker, name: company_name, last_price: previous_close)
		rescue => exception
			return nil
		end
	end

end
