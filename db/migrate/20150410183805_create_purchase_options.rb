class CreatePurchaseOptions < ActiveRecord::Migration
  def change
    create_table :purchase_options do |t|
      t.string :quality
      t.float :price
      t.timestamps null: false
    end
  end
end
