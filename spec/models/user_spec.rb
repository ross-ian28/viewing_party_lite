require "rails_helper"

RSpec.describe User, type: :model do
  describe "relationships" do
    it { should have_many :user_parties }
    it { should have_many(:parties).through(:user_parties) }
  end

  describe "validations" do
    it { should validate_uniqueness_of(:email) }
    it { should have_secure_password }
    it "can make a user" do
      user = User.create(name: "Pabu", email: "pabu@test.com", password: "password123", password_confirmation: "password123")
      expect(user).to_not have_attribute(:password)
      expect(user.password_digest).to_not eq("password123")
    end
  end
end
