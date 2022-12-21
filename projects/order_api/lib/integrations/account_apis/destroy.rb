module Integrations
  module AccountApis
    class Destroy < ::Integrations::AccountApis::Base

      attr_reader :id

      def initialize(id)
        @id = id
      end

      private

      def uri
        "#{Rails.application.config.app.payment_api.url}/v0/accounts/#{id}"
      end
    end
  end
end
