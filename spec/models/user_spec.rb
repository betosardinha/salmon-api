# frozen_string_literal: true

require "rails_helper"

# == Schema Information
#
# Table name: users
#
#  id                :uuid             not null, primary key
#  active            :boolean          default(TRUE), not null
#  email             :string           not null
#  email_verified_at :datetime
#  last_sign_in_at   :datetime
#  name              :string           not null
#  password_digest   :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  describe "associations" do
    it { is_expected.to have_many(:sessions).dependent(:destroy) }
  end

  describe "validations" do
    it { is_expected.to have_secure_password }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { is_expected.to allow_value("user@example.com").for(:email) }
    it { is_expected.not_to allow_values("user", "user@", "@example.com").for(:email) }

    it "allows inactive users" do
      user.active = false
      expect(user).to be_valid
    end
  end

  describe "email normalization" do
    it "strips spaces and downcases the email" do
      user.email = "  User@Example.COM "
      expect(user.email).to eq("user@example.com")
    end
  end

  describe "defaults" do
    it "is active when created" do
      expect(create(:user)).to be_active
    end
  end
end
