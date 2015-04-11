class AddIndexToPurchases < ActiveRecord::Migration
  def change
    add_index :purchases, :movie_purchase_option_id
    add_index :purchases, :user_id
  end
end
