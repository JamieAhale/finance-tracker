class Stock < ApplicationRecord

	def self.new_lookup(name)
		@name = name
		client = Alphavantage::TimeSeries.search(keywords: @name)
		ticker = client.first.symbol
		stock =  Alphavantage::TimeSeries.new(symbol: ticker).quote
		stock.previous_close
	end

end
