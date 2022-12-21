module ApplicationManager
  class Creator < ApplicationManager::Base

    def create(with_transaction = true)
      if with_transaction
        ActiveRecord::Base.transaction { execute_creation }
      else
        execute_creation
      end
    end

    private

    def execute_creation
      raise NotImplementedError
    end
  end
end
