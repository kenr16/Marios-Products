require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path

    click_link 'Sign up'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'hello'
    fill_in 'user_password_confirmation', :with => 'hello'
    click_on 'Sign Up'
    visit products_path

    click_link 'New Product'
    fill_in 'Name', :with => 'Chocolate'
    fill_in 'Price', :with => '30'
    fill_in 'Country', :with => 'Belgium'
    fill_in 'Picture', :with => 'http://www.lulas.com/images/slides/gift-sets.jpg'
    fill_in 'Description', :with => 'Chocolate is pretty self-explanatory, but there is a 50 word minimum description length so here are some more words for you.'
    click_on 'Create Product'
    expect(page).to have_content 'Products'
  end

  it "gives error when no info is entered" do
    visit new_product_path

    click_link 'Sign up'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'hello'
    fill_in 'user_password_confirmation', :with => 'hello'
    click_on 'Sign Up'

    visit products_path

    click_link 'New Product'
    expect(page).to have_content 'New Product'

    click_on 'Create Product'
    expect(page).to have_content 'errors'
  end

  it "gives error when the price is too high" do
    visit new_product_path

    click_link 'Sign up'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'hello'
    fill_in 'user_password_confirmation', :with => 'hello'
    click_on 'Sign Up'

    visit products_path

    click_link 'New Product'
    fill_in 'Name', :with => 'Chocolate'
    fill_in 'Price', :with => '600'
    fill_in 'Country', :with => 'Belgium'
    fill_in 'Picture', :with => 'http://www.lulas.com/images/slides/gift-sets.jpg'
    fill_in 'Description', :with => 'Chocolate is pretty self-explanatory, but there is a 50 word minimum description length so here are some more words for you.'
    click_on 'Create Product'

    expect(page).to have_content 'This item is far too expensive to stock here!'

  end

  it "gives error when the price is too low" do
    visit new_product_path

    click_link 'Sign up'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'hello'
    fill_in 'user_password_confirmation', :with => 'hello'
    click_on 'Sign Up'

    visit products_path

    click_link 'New Product'
    fill_in 'Name', :with => 'Chocolate'
    fill_in 'Price', :with => '-400'
    fill_in 'Country', :with => 'Belgium'
    fill_in 'Picture', :with => 'http://www.lulas.com/images/slides/gift-sets.jpg'
    fill_in 'Description', :with => 'Chocolate is pretty self-explanatory, but there is a 50 word minimum description length so here are some more words for you.'
    click_on 'Create Product'

    expect(page).to have_content 'This item is far too expensive to stock here!'

  end

  it "gives error when the price is not rounded off to whole cents" do
    visit new_product_path

    click_link 'Sign up'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'hello'
    fill_in 'user_password_confirmation', :with => 'hello'
    click_on 'Sign Up'

    visit products_path

    click_link 'New Product'
    fill_in 'Name', :with => 'Chocolate'
    fill_in 'Price', :with => '50.79248943284023'
    fill_in 'Country', :with => 'Belgium'
    fill_in 'Picture', :with => 'http://www.lulas.com/images/slides/gift-sets.jpg'
    fill_in 'Description', :with => 'Chocolate is pretty self-explanatory, but there is a 50 word minimum description length so here are some more words for you.'
    click_on 'Create Product'

    expect(page).to have_content 'This item is far too expensive to stock here!'

  end

  it "gives an error when the country in question does not actually exist." do
    visit products_path

    click_link 'Sign up'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'hello'
    fill_in 'user_password_confirmation', :with => 'hello'
    click_on 'Sign Up'
    visit products_path

    click_link 'New Product'
    fill_in 'Name', :with => 'Chocolate'
    fill_in 'Price', :with => '30'
    fill_in 'Country', :with => 'Atlantis'
    fill_in 'Picture', :with => 'http://www.lulas.com/images/slides/gift-sets.jpg'
    fill_in 'Description', :with => 'Chocolate is pretty self-explanatory, but there is a 50 word minimum description length so here are some more words for you.'
    click_on 'Create Product'
    expect(page).to have_content 'Products'
  end

end
