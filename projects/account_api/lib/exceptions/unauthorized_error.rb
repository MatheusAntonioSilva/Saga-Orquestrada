module Exceptions
  class UnauthorizedError < ::Exceptions::Base

    CODE = :unauthorized
    MESSAGE = 'errors.messages.unauthorized'.freeze
  end
end
