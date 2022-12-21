module Receivables
  class DestroyerJob < ApplicationJob

    queue_as :default

    def perform(args = {})
      args = args.with_indifferent_access
      ::Integrations::PaymentApis::Destroy.new(args[:id]).delete!
    end
  end
end
