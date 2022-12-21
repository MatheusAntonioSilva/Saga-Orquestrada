module ApplicationManager
  class Destroyer < ApplicationManager::Base

    attr_reader :id

    def initialize(id)
      @id = id
    end

    def destroy
      instance.destroy
    end

    private

    def instance
      raise NotImplementedError
    end
  end
end
