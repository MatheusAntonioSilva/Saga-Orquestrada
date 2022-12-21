module Integrations
  module AccountApis
    class Create < ::Integrations::AccountApis::Base

      attr_reader :args

      def initialize(args = {})
        @args = args
      end

      private

      def uri
        "#{Rails.application.config.app.payment_api.url}/v0/accounts"
      end

      def params
        {
          "name": args[:name],
          "order_id": args[:order_id]
        }
      end
    end
  end
end
