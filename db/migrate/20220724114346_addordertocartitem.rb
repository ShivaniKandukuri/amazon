class Addordertocartitem < ActiveRecord::Migration[6.0]
  def change
    add_reference :cartitems, :order, null: true, foreign_key: true
  end
end
