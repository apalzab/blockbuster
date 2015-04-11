class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.belongs_to :movie_purchase_option
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
