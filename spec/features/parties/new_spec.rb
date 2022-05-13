require "rails_helper"

RSpec.describe "New viewing party page" do
  let!(:pabu) { User.create!(name: "Pabu", email: "pabu@email.com") }

  before :each do
    visit "/users/#{pabu.id}/movies/550/viewing-party/new"
  end

  it "has title of movie" do
    expect(page).to have_content("Fight Club")
  end

  it "has duration of party pre-filled w/ movie duration (in mins)" do
    expect(page).to have_content(139)
  end

  it "has date field" do
    expect(page).to have_field("Date")
  end

  it "has start time field" do
    expect(page).to have_content("Start time")
  end

  it "has check boxes for users" do
    check "Pabu"
    within ".Pabu" do
      expect(page).to have_field("Pabu", checked: true)
    end
  end
end
