require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_link 'Sign up'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'hello'
    fill_in 'user_password_confirmation', :with => 'hello'
    click_on 'Sign Up'

    product = Product.create(:price => 30, :name => 'Chocolate', :country => 'Belgium', :picture => 'http://www.lulas.com/images/slides/gift-sets.jpg', :description => 'Chocolate from Belgium.  Absolutely delicious.  Putting in more characters to fill the minimum review length.')
    visit product_path(product)

    click_link 'Edit Product'
    fill_in 'Name', :with => 'Pinapple'
    fill_in 'Price', :with => '15'
    fill_in 'Country', :with => 'Mexico'
    fill_in 'Picture', :with => 'http://cdn1.medicalnewstoday.com/content/images/articles/276/276903/pineapple.jpg'
    fill_in 'Description', :with => 'Pineapple is pretty self-explanatory, but there is a 50 word minimum description length so here are some more words for you.'
    click_on 'Update Product'
    expect(page).to have_content 'Pinapple'
  end

  it "gives error when no info is entered" do
    visit products_path
    click_link 'Sign up'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'hello'
    fill_in 'user_password_confirmation', :with => 'hello'
    click_on 'Sign Up'

    product = Product.create(:price => 30, :name => 'Chocolate', :country => 'Belgium', :picture => 'http://www.lulas.com/images/slides/gift-sets.jpg', :description => 'Chocolate from Belgium.  Absolutely delicious.  Putting in more characters to fill the minimum review length.')
    visit product_path(product)

    click_link 'Edit Product'
    fill_in 'Name', :with => 'Pinapple'
    fill_in 'Price', :with => '15'
    fill_in 'Country', :with => 'Mexico'
    fill_in 'Picture', :with => 'http://cdn1.medicalnewstoday.com/content/images/articles/276/276903/pineapple.jpg'
    fill_in 'Description', :with => ''
    click_on 'Update Product'
    expect(page).to have_content 'errors'
  end
end
