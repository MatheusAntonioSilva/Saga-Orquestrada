module Receivables
  class DestroyerJob < ApplicationJob

    queue_as :default

    def perform(args = {})
      args = args.with_indifferent_access
      ::Integrations::ReceivableApis::Destroy.new(args[:order_id]).delete!
    end
  end
end
