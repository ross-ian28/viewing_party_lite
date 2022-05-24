require "rails_helper"

RSpec.describe "Landing page" do
  let!(:loki) { User.create!(name: "Loki", email: "loki@email.com", password: "loki123", password_confirmation: "loki123") }
  let!(:thor) { User.create!(name: "Thor", email: "thor@email.com", password: "thor123", password_confirmation: "thor123") }
  let!(:ian) { User.create!(name: "Ian", email: "ian@email.com", password: "ian123", password_confirmation: "ian123") }
  let!(:phillip) { User.create!(name: "Phillip", email: "phillip@email.com", password: "phillip123", password_confirmation: "phillip123") }

  before :each do
    @user = User.create!(name: "Pabu", email: "pabu@email.com", password: "pabu123", password_confirmation: "pabu123")

    visit "/"
  end

  it "has title of application" do
    expect(page).to have_content("Viewing Party Lite")
  end

  it "has button to create new user" do
    click_button("Register")
    expect(current_path).to eq("/register")
  end

  it "has link to go back to landing page" do
    click_link "Landing Page"
    expect(current_path).to eq("/")
  end

  it "has link to login" do
    click_button "Login"
    expect(current_path).to eq("/login")
  end

  it "can log out" do
    visit "/login"

    fill_in "email", with: "pabu@email.com"
    fill_in "password", with: "pabu123"

    click_button "Login"

    visit "/"

    click_button "Logout"

    expect(current_path).to eq("/")
    expect(page).to have_selector(:button, "Login")
  end
end
