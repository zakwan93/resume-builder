Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'users#index'


  resources :resumes
  resources :introductions
  resources :objectives
  resources :summary
  resources :skills
  resources :experiences
  resources :users
end
