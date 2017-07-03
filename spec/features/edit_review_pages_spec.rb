require 'rails_helper'

describe "the edit a review process" do
  it "edits a review" do

    visit products_path
    click_link 'Sign up'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'hello'
    fill_in 'user_password_confirmation', :with => 'hello'
    click_on 'Sign Up'
    visit products_path

    product = Product.create(:price => 30, :name => 'Chocolate', :country => 'Belgium', :picture => 'http://www.lulas.com/images/slides/gift-sets.jpg', :description => 'Chocolate from Belgium.  Absolutely delicious.  Putting in more characters to fill the minimum review length.')
    review = Review.create(:author => 'John', :rating => 5, :content => 'This chocolate was absolutely delicious!  Putting in more characters to fill the minimum review length.', :product_id => product.id)

    visit product_path(product)

    click_on 'Edit'
    fill_in 'Author', :with => 'John'
    fill_in 'Rating', :with => '1'
    fill_in 'Content', :with => 'Absolutely cheap chocolate!'
    click_on 'Update Review'
    expect(page).to have_content 'Absolutely cheap chocolate!'
  end

  it "gives error when no description is entered" do
    product = Product.create(:price => 30, :name => 'Chocolate', :country => 'Belgium', :picture => 'http://www.lulas.com/images/slides/gift-sets.jpg', :description => 'Chocolate from Belgium.  Absolutely delicious.  Putting in more characters to fill the minimum review length.')
    review = Review.create(:author => 'John', :rating => 5, :content => 'This chocolate was absolutely delicious!', :product_id => product.id)
    visit product_path(product)
    click_on 'Edit'
    fill_in 'Content', :with => ''
    click_button 'Update Review'
    expect(page).to have_content 'errors'
  end
end
