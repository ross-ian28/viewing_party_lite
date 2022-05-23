require "rails_helper"

RSpec.describe "creates new user" do
  describe "fills in form" do
    it "form happy path" do
      visit "/register"

      fill_in "Name", with: "Pabu"
      fill_in "Email", with: "pabu@gmail.com"
      fill_in "Password", with: "pabu123"
      fill_in "Password confirmation", with: "pabu123"

      click_button "Register"

      expect(page).to have_content("Pabu")
    end
    it "form sad path" do
      visit "/register"

      fill_in "Name", with: "Pabu"
      fill_in "Email", with: "pabu@gmail.com"
      fill_in "Password", with: "pabu123"
      fill_in "Password confirmation", with: "pabu321"

      click_button "Register"

      expect(current_path).to eq("/register")
      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end
end
