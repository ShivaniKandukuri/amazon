class Product < ApplicationRecord
  belongs_to :category
  has_many :cartitems, dependent: :destroy
end
