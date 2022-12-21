module Exceptions
  class AccessNotAllowedError < ::Exceptions::Base

    CODE = :unauthorized
    MESSAGE = 'errors.messages.access_not_allowed'.freeze
  end
end
