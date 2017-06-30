require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_link 'New Product'
    fill_in 'Name', :with => 'Chocolate'
    fill_in 'Price', :with => '30'
    fill_in 'Country', :with => 'Belgium'
    fill_in 'Picture', :with => 'http://www.lulas.com/images/slides/gift-sets.jpg'
    fill_in 'Description', :with => 'Chocolate is pretty self-explanatory'
    click_on 'Create Product'
    expect(page).to have_content 'Products'
  end

  it "gives error when no info is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content 'errors'
  end
end
