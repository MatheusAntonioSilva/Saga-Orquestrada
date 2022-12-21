module Integrations
  module ReceivableApis
    class Destroy < ::Integrations::ReceivableApis::Base

      attr_reader :id

      def initialize(id)
        @id = id
      end

      private

      def uri
        "#{Rails.application.config.app.receivable_api.url}/v0/receivables/#{id}"
      end
    end
  end
end
