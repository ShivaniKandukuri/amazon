class AddColumnsToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :Line1, :string
    add_column :orders, :Line2, :string
    add_column :orders, :city, :string
    add_column :orders, :state, :string
    add_column :orders, :postalcode, :integer
    add_column :orders, :country, :string
  end
end
