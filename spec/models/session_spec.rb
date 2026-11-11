# frozen_string_literal: true

require "rails_helper"

# == Schema Information
#
# Table name: sessions
#
#  id         :uuid             not null, primary key
#  ip_address :string
#  token      :string           not null
#  user_agent :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_sessions_on_token    (token) UNIQUE
#  index_sessions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
RSpec.describe Session, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "token" do
    it "is generated automatically" do
      expect(build(:session).token).to be_present
    end

    it "is different for each session" do
      user = create(:user)
      first, second = create_list(:session, 2, user: user)
      expect(first.token).not_to eq(second.token)
    end
  end

  describe "deleting a user" do
    it "deletes their sessions" do
      session = create(:session)
      expect { session.user.destroy }.to change(described_class, :count).by(-1)
    end
  end
end
