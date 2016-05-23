require 'rails_helper'

feature "User logs in and logs out" do

  # `js: true` spec metadata means this will run using the `:selenium`
  # browser driver configured in spec/support/capybara.rb
  scenario "with correct details", js: true do

    create(:user, email: "someone@example.tld", password: "somepassword")

    visit "/"

    click_link "Log in"
    expect(page).to have_css("h4", text: "Log in")
    expect(current_path).to eq(new_user_session_path)

    login "someone@example.tld", "somepassword"

    expect(page).to have_content "Discounts"
    expect(current_path).to eq "/"
    expect(page).to have_id("notice", text: "Signed in successfully.")

    click_button "Sign out"

    expect(current_path).to eq "/"
    expect(page).to have_id("notice", text: "Signed out successfully.")
    expect(page).not_to have_link "Sign out"

  end

  scenario "with wrong password cannot login" do

    visit new_user_session_path

    login "e@example.tld", "test-password"

    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_content "Invalid Email or password."
    expect(current_path).to eq(new_user_session_path)
  end

  private

  def login(email, password)
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Log in"
  end

end