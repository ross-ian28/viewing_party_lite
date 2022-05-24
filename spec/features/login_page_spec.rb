require "rails_helper"

RSpec.describe "Landing page" do
  let!(:pabu) { User.create!(name: "Pabu", email: "pabu@email.com", password: "pabu123", password_confirmation: "pabu123") }
  let!(:loki) { User.create!(name: "Loki", email: "loki@email.com", password: "loki123", password_confirmation: "loki123") }
  let!(:thor) { User.create!(name: "Thor", email: "thor@email.com", password: "thor123", password_confirmation: "thor123") }
  let!(:ian) { User.create!(name: "Ian", email: "ian@email.com", password: "ian123", password_confirmation: "ian123") }
  let!(:phillip) { User.create!(name: "Phillip", email: "phillip@email.com", password: "phillip123", password_confirmation: "phillip123") }

  before :each do
    visit "/login"
  end

  describe "correct validations" do
    it "fills in form correctly" do
      fill_in "email", with: "pabu@email.com"
      fill_in "password", with: "pabu123"

      click_button "Login"

      expect(page).to have_content("Pabu")
    end
  end
  describe "incorrect validations" do
    it "fills in form incorrectly" do
      fill_in "password", with: "pabu123"

      click_button "Login"

      expect(current_path).to eq("/login")
      expect(page).to have_content("Invalid info")
    end
  end
end
