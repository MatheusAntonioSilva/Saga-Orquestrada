module PaymentManager
  class Destroyer < ApplicationManager::Destroyer

    def initialize(id)
      super(id)
    end

    def destroy
      super()
    end

    private

    def instance
      ::Payment.find(id)
    end
  end
end
