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
class User < ApplicationRecord
  has_secure_password

  has_many :sessions, dependent: :destroy

  normalizes :email, with: ->(email) { email.strip.downcase }

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :active, inclusion: { in: [ true, false ] }
end
