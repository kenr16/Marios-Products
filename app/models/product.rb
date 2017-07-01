require 'country_lookup'
#This class MUST be located above the Product class, unless I decided to split it up into a separate file. (Which I won't)
class PriceValidator < ActiveModel::Validator

  def validate(user_entry)
    if user_entry.price >= 350
      user_entry.errors[:base] << "This item is far too expensive to stock here!"
    elsif user_entry.price <= 0
      user_entry.errors[:base] << "We do not give away free items here!"
    elsif number_of_decimals(user_entry.price.to_f) > 2
      user_entry.errors[:base] << "We do not sell items with fractions of a cent!"
    end
  end

  #This function will count the number of decimal places by multiplying by 10 until the value is an integer.
  def number_of_decimals(val)
    num = 0
    while (val != val.to_i)
      val *= 10
      num += 1
    end
    num
  end

end

class CountryValidator < ActiveModel::Validator
  def validate(user_entry)
    if !lookup(user_entry.country)
      user_entry.errors[:base] << "This is not a valid country!"
    end
  end

  def lookup(country)
    array_of_countries = Country.names
    array_of_countries.include?(country)
  end
end



class Product < ActiveRecord::Base

  has_many :reviews

  validates :name, :presence => true
  validates :name, :length => {
    :minimum => 3,
    :maximum => 50,
    :too_short => "%{count} characters is the minimum allowed for a name.",
    :too_long => "%{count} characters is the maximum allowed for a name."
  }

  validates :price, :presence => true
  # validates_with PriceValidator
  # Price validations can be enabled by uncommenting the previous line of code, however, due to a glitch in how ruby processes float numbers, recommend only doing so AFTER seeding the database.

  validates :country, :presence => true
  # validates_with CountryValidator
  # Country validator can be enabled by uncommenting the previous line of code, HOWEVER, the list of countries and the Faker gem will not always validate against the list of countries in the Country_Lookup gem.  Recomend you only do so AFTER seeding the database.

  validates :picture, :presence => true

  validates :description, :presence => true
  validates :description, :length => {
    :minimum => 50,
    :maximum => 250,
    :too_short => "%{count} characters is the minimum allowed for a product description.",
    :too_long => "%{count} characters is the maximum allowed for a product description."
  }

  scope :most_recent, -> { order(created_at: :desc).limit(5)}
  scope :alphabetical, -> { order(name: :asc)}
  scope :local, -> { where(country: 'United States of America')}
  scope :most_reviews, -> {(select("products.id, products.name, products.description,products.country, count(reviews.id) as reviews_count").joins(:reviews).group("products.id").order("reviews_count DESC").limit(10))}
end
