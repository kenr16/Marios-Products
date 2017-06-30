class PriceValidator < ActiveModel::Validator

  def validate(user_entry)
    if user_entry.price >= 250
      user_entry.errors[:base] << "This item is far too expensive to stock here!"
    elsif user_entry.price <= 0
      user_entry.errors[:base] << "We do not give away free items here!"
    elsif Number_of_decimals(user_entry.price.to_f) > 2
      user_entry.errors[:base] << "We do not sell items with fractions of a cent!"
    end
  end

  def Number_of_decimals(val)
    num = 0
    while (val != val.to_i)
      val *= 10
      num += 1
    end
    num
  end

end

class Product < ActiveRecord::Base

  has_many :reviews

  validates :name, :presence => true
  validates :price, :presence => true
  validates_with PriceValidator
  validates :country, :presence => true
  validates :picture, :presence => true

  validates :description, :presence => true
  validates :description, :length => {
    :minimum => 20,
    :maximum => 250,
    :too_short => "%{count} characters is the minimum allowed for a product description.",
    :too_long => "%{count} characters is the maximum allowed for a product description."
  }
end
