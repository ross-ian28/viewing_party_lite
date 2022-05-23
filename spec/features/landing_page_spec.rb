require "rails_helper"

RSpec.describe "Landing page" do
  let!(:pabu) { User.create!(name: "Pabu", email: "pabu@email.com", password: "pabu123", password_confirmation: "pabu123") }
  let!(:loki) { User.create!(name: "Loki", email: "loki@email.com", password: "loki123", password_confirmation: "loki123") }
  let!(:thor) { User.create!(name: "Thor", email: "thor@email.com", password: "thor123", password_confirmation: "thor123") }
  let!(:ian) { User.create!(name: "Ian", email: "ian@email.com", password: "ian123", password_confirmation: "ian123") }
  let!(:phillip) { User.create!(name: "Phillip", email: "phillip@email.com", password: "phillip123", password_confirmation: "phillip123") }

  before :each do
    visit "/"
  end

  it "has title of application" do
    expect(page).to have_content("Viewing Party Lite")
  end

  it "has button to create new user" do
    click_button("Create New User")
    expect(current_path).to eq("/register")
  end

  it "has list of existing users w/ links" do
    within ".Pabu" do
      click_link "Pabu"
    end
  end

  it "has link to go back to landing page" do
    click_link "Landing Page"
    expect(current_path).to eq("/")
  end
end
