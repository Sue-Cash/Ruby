Rails.application.routes.draw do
  get "step_entries/index"
  get "step_entries/new"
  get "step_entries/create"
  get "step_entries/show"
  get "step_entries/edit"
  get "step_entries/update"
  get "step_entries/destroy"
  devise_for :users
  get "weight_entries/index"
  root "weight_entries#index"
  resources :weight_entries
  resources :step_entries
end