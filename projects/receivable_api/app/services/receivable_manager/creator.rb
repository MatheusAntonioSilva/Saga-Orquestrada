module ReceivableManager
  class Creator < ApplicationManager::Creator

    attr_reader :args

    def initialize(args)
      @args = args
    end

    private

    def execute_creation
      ::Receivable.create!(args)
    end
  end
end
