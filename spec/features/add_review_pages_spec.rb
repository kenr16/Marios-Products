require 'rails_helper'

describe "the add a review process" do
  it "adds a review" do

    visit products_path
    click_link 'Sign up'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'hello'
    fill_in 'user_password_confirmation', :with => 'hello'
    click_on 'Sign Up'
    visit products_path

    product = Product.create(:price => 30, :name => 'Chocolate', :country => 'Belgium', :picture => 'http://www.lulas.com/images/slides/gift-sets.jpg', :description => 'Chocolate from Belgium.  Absolutely delicious.  Putting in more characters to fill the minimum review length.')
    visit product_path(product)
    click_on 'Add a review'
    fill_in 'Author', :with => 'John'
    find('#review_rating').find(:xpath, 'option[2]').select_option
    fill_in 'Content', :with => 'This chocolate was absolutely delicious!  Putting in more characters to fill the minimum review length.'
    click_on 'Create Review'
    expect(page).to have_content 'This chocolate was absolutely delicious!'
  end

  it "gives error when no description is entered" do
    visit products_path
    click_link 'Sign up'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'hello'
    fill_in 'user_password_confirmation', :with => 'hello'
    click_on 'Sign Up'
    visit products_path

    product = Product.create(:price => 30, :name => 'Chocolate', :country => 'Belgium', :picture => 'http://www.lulas.com/images/slides/gift-sets.jpg', :description => 'Chocolate from Belgium.  Absolutely delicious.  Putting in more characters to fill the minimum review length.')
    visit product_path(product)
    click_on 'Add a review'
    fill_in 'Author', :with => 'John'
    find('#review_rating').find(:xpath, 'option[2]').select_option
    fill_in 'Content', :with => ''
    click_on 'Create Review'
    expect(page).to have_content 'errors'
  end
end
