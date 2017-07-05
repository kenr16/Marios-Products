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
    click_link 'Delete Product'
    expect(page).to have_content 'Product successfully deleted!'
  end

end
