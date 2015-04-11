class CreateMoviePurchaseOptions < ActiveRecord::Migration
  def change
    create_table :movie_purchase_options do |t|
      t.belongs_to :movie, index: true
      t.belongs_to :purchase_option, index: true
      t.float :price
      t.boolean :active, default: false
      t.timestamps null: false
    end
  end
end
