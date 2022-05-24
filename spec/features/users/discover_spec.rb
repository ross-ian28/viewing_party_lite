require "rails_helper"

RSpec.describe "Discover page" do
  let!(:pabu) { User.create!(name: "Pabu", email: "pabu@email.com", password: "pabu123", password_confirmation: "pabu123") }
  before :each do
    visit "/login"

    fill_in "email", with: "pabu@email.com"
    fill_in "password", with: "pabu123"

    click_button "Login"
  end
  it "has button to discover top rated movies" do
    visit "/dashboard/discover"

    click_button "Discover Top-Rated Movies"
    expect(current_path).to eq("/dashboard/dashboard/movies")
    expect("The Shawshank Redemption").to appear_before("The Godfather")
  end

  it "can search by title" do
    visit "/dashboard/discover"

    fill_in :title, with: "Shawshank"
    click_button "Search"
    expect(page).to have_content("The Shawshank Redemption")
    expect(page).to_not have_content("The Godfather")
  end
end
