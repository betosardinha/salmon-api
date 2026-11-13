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
class Session < ApplicationRecord
  include PublicIdentifiable

  public_prefix :sess

  belongs_to :user

  has_secure_token

  validates :token, presence: true
end
