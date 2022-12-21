module Exceptions
  class Base < StandardError

    CODE = :internal_server_error
    MESSAGE = 'errors.messages.unavailable'.freeze

    attr_reader :errors_detail

    def initialize(errors_detail = nil)
      @errors_detail = errors_detail
      super(errors_detail)
    end

    def message
      return I18n.t(self.class::MESSAGE, errors_detail: errors_detail) if errors_detail.present?

      I18n.t(self.class::MESSAGE)
    end

    def code
      self.class::CODE
    end
  end
end
