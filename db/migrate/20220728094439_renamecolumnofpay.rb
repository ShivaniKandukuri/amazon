class Renamecolumnofpay < ActiveRecord::Migration[6.0]
  def change
    rename_column :pays,:type,:paytype
  end
end
