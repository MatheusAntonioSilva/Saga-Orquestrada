module Exceptions
  class RegistrationError < ::Exceptions::Base

    CODE = :unprocessable_entity
    MESSAGE = 'errors.messages.registration'.freeze
  end
end
