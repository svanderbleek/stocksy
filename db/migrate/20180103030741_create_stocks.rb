class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.references :portfolio, foreign_key: true
      t.string :symbol
      t.integer :shares
      t.float :price
      t.float :last_price

      t.timestamps
    end
  end
end
