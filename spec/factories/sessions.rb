# frozen_string_literal: true

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
FactoryBot.define do
  factory :session do
    user

    trait :with_device do
      ip_address { Faker::Internet.ip_v4_address }
      user_agent { Faker::Internet.user_agent }
    end
  end
end
