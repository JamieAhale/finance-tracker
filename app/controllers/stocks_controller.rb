class StocksController < ApplicationController

    def search
      if params[:stock].present?
        @stock = Stock.new_lookup(params[:stock])
        if @stock
          respond_to do |format|
            format.js { render partial: 'users/results' }
          end
        else
          flash.now[:alert] = "Invalid search term"
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