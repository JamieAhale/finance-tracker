class AddTickersToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :tickers, :text
  end
end
