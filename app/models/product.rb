class Product < ApplicationRecord
  validates :name,presence:true
  validates :price, presence: true, numericality: { greater_than: 0, less_than: 1000000 }
  validates :rating, presence: true, numericality: { greater_than: 0, less_than: 6 }

  belongs_to :category
  has_many :cartitems, dependent: :destroy
  has_one :image
  has_many :wishlists
  has_many :users,through: :wishlists

  def wishlisted?(user)
    !!self.wishlists.find{|w| w.user_id==user.id}
  end
  
end
