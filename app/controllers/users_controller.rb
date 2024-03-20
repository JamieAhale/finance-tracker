class UsersController < ApplicationController
  def portfolio
    @tracked_stocks = current_user.tickers
    # tickers = @tracked_stocks.map { |stock| stock.ticker }
    @stocks = StockPriceService.new(@tracked_stocks).call
    @user = current_user
  end

  def add_ticker
    @user = User.find(params[:id])
    ticker = params[:ticker].upcase

    if @user.tickers.include?(ticker)
      flash[:alert] = "#{ticker} is already in your portfolio"
      redirect_to my_portfolio_path and return
    end

    @user.tickers |= [ticker]

    if @user.save
      flash[:notice] = "#{ticker} added successfully"
      redirect_to my_portfolio_path
    else
      flash.now[:alert] = 'Unable to add stock'
      render 'users/portfolio' 
    end
  end

  def delete_ticker
    @user = User.find(params[:id])
    ticker = params[:ticker].upcase
  
    @user.tickers.delete(ticker)
  
    if @user.save
      flash[:notice] = "#{ticker} was successfully removed from your portfolio."
      redirect_to my_portfolio_path
    else
      flash[:alert] = "Unable to remove #{ticker} from your portfolio."
      render 'users/portfolio' 
    end
  end


  def update_order
    current_user.tickers = params[:order]
    if current_user.save
      head :ok
    else
      head :unprocessable_entity
    end
  end


end
