Rails.application.routes.draw do
  get 'cards', to: 'cards#index'
  post 'cards', to: 'cards#create'
  get 'cards/:id', to: 'cards#show', as: :card
end
