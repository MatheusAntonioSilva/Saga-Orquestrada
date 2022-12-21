module OrderManager
  class Creator < ApplicationManager::Creator

    attr_reader :args, :order

    def initialize(args)
      @args = args.with_indifferent_access
    end

    private

    def execute_creation
      @order = ::Order.create!(args)
      account = create_account_customer!(order)

      begin
        payment = create_payment!(order)
      rescue StandardError
        ::Accounts::Destroyer.perform(id: account[:id])
      end

      begin
        create_receivable!(order)
      rescue StandardError
        ::Accounts::Destroyer.perform(id: account[:id])
        ::Payments::Destroyer.perform(id: payment[:id])
        ::Receivables::Destroyer.perform(order_id: [:order_id])
      end
    end

    def create_account_customer!
      ::Integrations::AccountApis::Create.new(args[:customer].merge(order_id: order.id)).post!
    end

    def create_payment!
      ::Integrations::PaymentApis::Create.new(args[:payment].merge(order_id: order.id)).post!
    end

    def create_receivable!
      split = args.dig(:payment, :split).to_i

      for i in 1..split do
        description = "Receivable #{i} - #{split}"
        ::Integrations::ReceivablesApis::Create.new(description: description,
                                                    order_id: order.id).post!
      end
    end
  end
end
