require 'rails_helper'

describe "filter products using scopes" do
  it "will view most recent product" do
    visit products_path
    click_link 'Sign up'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'hello'
    fill_in 'user_password_confirmation', :with => 'hello'
    click_on 'Sign Up'

    product = Product.create(:price => 30, :name => 'Chocolate', :country => 'Belgium', :picture => 'http://www.lulas.com/images/slides/gift-sets.jpg', :description => 'Chocolate from Belgium.  Absolutely delicious.  Putting in more characters to fill the minimum review length.')
    visit products_path

    click_link 'Most Recent'
    expect(page).to have_content 'Chocolate'

  end

  it "will view products alphabetically" do
    visit products_path
    click_link 'Sign up'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'hello'
    fill_in 'user_password_confirmation', :with => 'hello'
    click_on 'Sign Up'

    product = Product.create(:price => 30, :name => 'Apple', :country => 'Belgium', :picture => 'http://www.lulas.com/images/slides/gift-sets.jpg', :description => 'Chocolate from Belgium.  Absolutely delicious.  Putting in more characters to fill the minimum review length.')
    visit products_path

    click_link 'Alphabetical'
    expect(page).to have_content 'Apple'

  end

  it "will view products made in the USA" do
    visit products_path
    click_link 'Sign up'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'hello'
    fill_in 'user_password_confirmation', :with => 'hello'
    click_on 'Sign Up'

    product = Product.create(:price => 30, :name => 'Chocolate', :country => 'United States of America', :picture => 'http://www.lulas.com/images/slides/gift-sets.jpg', :description => 'Chocolate from Belgium.  Absolutely delicious.  Putting in more characters to fill the minimum review length.')
    visit products_path

    click_link 'Local (USA)'
    expect(page).to have_content 'Chocolate'

  end

  it "will view products with the most reviews" do
    visit products_path
    click_link 'Sign up'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'hello'
    fill_in 'user_password_confirmation', :with => 'hello'
    click_on 'Sign Up'

    product = Product.create(:price => 30, :name => 'Chocolate', :country => 'United States of America', :picture => 'http://www.lulas.com/images/slides/gift-sets.jpg', :description => 'Chocolate from Belgium.  Absolutely delicious.  Putting in more characters to fill the minimum review length.')
    review1 = Review.create(:author => 'John', :rating => 5, :content => 'This chocolate was absolutely delicious!  Putting in more characters to fill the minimum review length.', :product_id => product.id)
    review2 = Review.create(:author => 'John', :rating => 5, :content => 'This chocolate was absolutely delicious!  Putting in more characters to fill the minimum review length.', :product_id => product.id)
    review3 = Review.create(:author => 'John', :rating => 5, :content => 'This chocolate was absolutely delicious!  Putting in more characters to fill the minimum review length.', :product_id => product.id)
    review4 = Review.create(:author => 'John', :rating => 5, :content => 'This chocolate was absolutely delicious!  Putting in more characters to fill the minimum review length.', :product_id => product.id)
    review5 = Review.create(:author => 'John', :rating => 5, :content => 'This chocolate was absolutely delicious!  Putting in more characters to fill the minimum review length.', :product_id => product.id)
    review6 = Review.create(:author => 'John', :rating => 5, :content => 'This chocolate was absolutely delicious!  Putting in more characters to fill the minimum review length.', :product_id => product.id)
    review7 = Review.create(:author => 'John', :rating => 5, :content => 'This chocolate was absolutely delicious!  Putting in more characters to fill the minimum review length.', :product_id => product.id)
    review8 = Review.create(:author => 'John', :rating => 5, :content => 'This chocolate was absolutely delicious!  Putting in more characters to fill the minimum review length.', :product_id => product.id)
    review9 = Review.create(:author => 'John', :rating => 5, :content => 'This chocolate was absolutely delicious!  Putting in more characters to fill the minimum review length.', :product_id => product.id)

    visit products_path

    click_link 'Most Reviews'
    expect(page).to have_content 'Chocolate'

  end


end
