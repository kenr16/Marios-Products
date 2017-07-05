require 'rails_helper'

describe "The create new user process" do
  it "creates a new user" do
    visit products_path
    click_link 'Sign up'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'hello'
    fill_in 'user_password_confirmation', :with => ''
    click_on 'Sign Up'

    expect(page).to have_content 'There was a problem signing up'
  end

  it "creates a new user then logs out" do
    visit products_path
    click_link 'Sign up'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'hello'
    fill_in 'user_password_confirmation', :with => 'hello'
    click_on 'Sign Up'
    click_on 'Sign out'

    expect(page).to have_content "You've signed out."
  end

  it "creates a new user then logs out only to log back in again" do
    visit products_path
    click_link 'Sign up'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'hello'
    fill_in 'user_password_confirmation', :with => 'hello'
    click_on 'Sign Up'
    click_on 'Sign out'

    expect(page).to have_content "You've signed out."

    click_on 'Sign in'
    fill_in 'email', :with => 'user@email.com'
    fill_in 'password', :with => 'hello'

    click_on 'Log in'

    expect(page).to have_content "You've signed in."
  end

  it "gives error when incorrect is entered" do
    visit products_path
    click_link 'Sign up'
    fill_in 'user_email', :with => 'user@email.com'
    fill_in 'user_password', :with => 'hello'
    fill_in 'user_password_confirmation', :with => 'hello'
    click_on 'Sign Up'
    click_on 'Sign out'

    expect(page).to have_content "You've signed out."

    click_on 'Sign in'
    fill_in 'email', :with => 'user@email.com'
    fill_in 'password', :with => 'password'

    click_on 'Log in'

    expect(page).to have_content 'There was a problem signing in'
  end




end
