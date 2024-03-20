class StockPriceService
	def initialize(tickers)
		@tracked_tickers = tickers
	end

	def call
		@tracked_tickers.map do |ticker|
			StockLookupService.new_lookup(ticker)
		end
	end
end
  