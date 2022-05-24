require "rails_helper"

RSpec.describe "user dashboard page" do
  before :each do
    @user = User.create!(name: "Pabu", email: "pabu@email.com", password: "pabu123", password_confirmation: "pabu123")
    visit "/login"

    fill_in "email", with: "pabu@email.com"
    fill_in "password", with: "pabu123"

    click_button "Login"
  end

  describe "user show" do
    it "has button to discover movies" do
      visit "dashboard"
      click_button "Discover Movies"

      expect(current_path).to eq("/dashboard/discover")
    end
    it "has section that lists viewing parties" do
      visit "dashboard"

      expect(page).to have_content("Viewing Parties")
    end
  end
end
