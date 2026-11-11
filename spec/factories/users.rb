# frozen_string_literal: true

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
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }

    trait :verified do
      email_verified_at { Time.current }
    end
  end
end
