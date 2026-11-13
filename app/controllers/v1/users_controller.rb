# frozen_string_literal: true

module V1
  class UsersController < ApplicationController
    def show
      user = User.find_by_public_id!(params[:id])

      render json: serialize(user, V1::UserSerializer)
    end
  end
end
