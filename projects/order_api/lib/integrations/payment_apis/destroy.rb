module Integrations
  module PaymentApis
    class Destroy < ::Integrations::PaymentApis::Base

      attr_reader :id

      def initialize(id)
        @id = id
      end

      private

      def uri
        "#{Rails.application.config.app.payment_api.url}/v0/payments/#{id}"
      end
    end
  end
end
