module Exceptions
  class FileError < ::Exceptions::Base

    CODE = :unprocessable_entity
    MESSAGE = 'errors.messages.file_error'.freeze
  end
end
