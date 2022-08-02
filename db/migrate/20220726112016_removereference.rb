class Removereference < ActiveRecord::Migration[6.0]
  def change
    remove_reference :images,:category,foreign_key:true
  end
end
