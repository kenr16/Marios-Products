class Review < ActiveRecord::Base

  belongs_to :product, foreign_key: :product_id
  # foreign_key specifies the foreign key name in the database.

  validates :author, :presence => true
  validates :rating, :presence => true
  validates :content, :presence => true
end
