class AddMinimumPriceToProduct < ActiveRecord::Migration
  def change
    add_column :products, :minimum_price, :integer
  end
end
