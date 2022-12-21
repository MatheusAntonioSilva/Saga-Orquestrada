class ApplicationJob < ActiveJob::Base
  include Sidekiq::Job
end
