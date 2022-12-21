Rails.application.routes.draw do

  mount Sidekiq::Web => '/sidekiq'

  namespace 'v0' do
    resources :orders, only: [:create]
  end
end
