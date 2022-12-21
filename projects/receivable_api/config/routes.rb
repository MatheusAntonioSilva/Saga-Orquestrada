Rails.application.routes.draw do

  namespace 'v0' do
    resources :receivables, only: [:create, :destroy]
  end
end
