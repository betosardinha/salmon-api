module V1
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :name

    def id
      self.public_id
    end

    def type
      "user"
    end
  end
end
