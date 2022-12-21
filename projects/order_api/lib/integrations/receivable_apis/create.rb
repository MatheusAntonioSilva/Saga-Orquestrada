module Integrations
  module ReceivableApis
    class Create < ::Integrations::ReceivableApis::Base

      attr_reader :args

      def initialize(args = {})
        @args = args
      end

      private

      def uri
        "#{Rails.application.config.app.payment_api.url}/v0/receivables"
      end

      def params
        {
          "description": args[:description],
          "order_id": args[:order_id]
        }
      end
    end
  end
end
