module PaymentManager
  class Creator < ApplicationManager::Creator

    attr_reader :args

    def initialize(args)
      @args = args
    end

    private

    def execute_creation
      ::Payment.create!(args)
    end
  end
end
