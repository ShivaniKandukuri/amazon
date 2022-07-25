class AddQuantityToCartitems < ActiveRecord::Migration[6.0]
  def change
    add_column :cartitems, :quantity, :integer
  end
end
