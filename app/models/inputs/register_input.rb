# frozen_string_literal: true

module Inputs

  # @summary Required fields for registering a new user
  class RegisterInput
    attr_accessor :email, :name, :password
  end
end