class Review < ActiveRecord::Base

  belongs_to :product, foreign_key: :product_id

  validates :author, :presence => true
  validates :rating, :presence => true
  validates :content, :presence => true
end
