class AddMobileNumbertoOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :mobilenumber, :integer
  end
end
