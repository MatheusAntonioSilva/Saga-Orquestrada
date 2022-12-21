require 'sidekiq/web'

Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  [user, password] == [Rails.application.config.app.sidekiq.user, Rails.application.config.app.sidekiq.password]
end

Sidekiq.configure_server do |config|
  config.redis = {
    url: Rails.application.config.app.sidekiq.redis.url,
    password: Rails.application.config.app.sidekiq.redis.password,
    network_timeout: 20
  }
end

Sidekiq.configure_client do |config|
  config.redis = {
    url: Rails.application.config.app.sidekiq.redis.url,
    password: Rails.application.config.app.sidekiq.redis.password
  }
end
