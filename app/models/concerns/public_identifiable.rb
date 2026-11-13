# frozen_string_literal: true

module PublicIdentifiable
  extend ActiveSupport::Concern

  included do
    class_attribute :public_id_prefix, instance_writer: false
  end

  class_methods do
    def public_prefix(prefix)
      self.public_id_prefix = prefix.to_s
    end

    def find_by_public_id!(token)
      raise ActiveRecord::RecordNotFound if token.blank? || public_id_prefix.blank?

      expected_prefix = "#{public_id_prefix}_"
      raise ActiveRecord::RecordNotFound unless token.start_with?(expected_prefix)

      encoded = token.delete_prefix(expected_prefix)
      hex = Base64.urlsafe_decode64(encoded).unpack1("H*")
      raise ActiveRecord::RecordNotFound unless hex.length == 32

      uuid = hex.sub(/\A(.{8})(.{4})(.{4})(.{4})(.{12})\z/, '\1-\2-\3-\4-\5')
      find(uuid)
    rescue ArgumentError
      raise ActiveRecord::RecordNotFound
    end
  end

  def public_id
    return nil if id.blank?

    hex = id.delete("-")
    encoded = Base64.urlsafe_encode64([ hex ].pack("H*"), padding: false)
    "#{self.class.public_id_prefix}_#{encoded}"
  end

  # def to_param
  #   public_id
  # end
end
