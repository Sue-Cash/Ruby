Rails.application.routes.draw do
  # Routes pour les step_entries
  get "step_entries/index"
  get "step_entries/new"
  get "step_entries/create"
  get "step_entries/show"
  get "step_entries/edit"
  get "step_entries/update"
  get "step_entries/destroy"
  
  # Configuration de Devise avec OmniAuth
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  # Routes pour weight_entries
  get "weight_entries/index"
  root "weight_entries#index"
  resources :weight_entries
  resources :step_entries
  
  # Route de débogage - peut être supprimée après résolution du problème
  get '/auth-debug', to: proc { |env| [200, {'Content-Type' => 'text/html'}, ["Routes chargées correctement"]] }
end