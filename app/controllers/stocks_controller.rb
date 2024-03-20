class StocksController < ApplicationController

  def search
    @user = current_user
    if params[:stock].present?
      stock = params[:stock].upcase
      @stock = StockLookupService.new_lookup(stock)
      if @stock[:status] == 'ERROR'
        flash.now[:alert] = "API call limit reached"
        respond_to do |format|
          format.js { render partial: 'users/results' }
        end
      elsif @stock[:status] == 'NOT_FOUND'
        flash.now[:alert] = "Invalid search term"
        respond_to do |format|
          format.js { render partial: 'users/results' }
        end
      else
        respond_to do |format|
          format.js { render partial: 'users/results' }
        end
      end
    else
      flash.now[:alert] = "Enter a search term"
      respond_to do |format|
        format.js { render partial: 'users/results' }
      end
    end
  end

end