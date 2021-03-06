Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'users#index'


  get "review", to: "users#review"
  get "newtemplate", to: "users#newtemplate"

  resources :resumes
  resources :introductions
  resources :objectives
  resources :summary
  resources :skills
  resources :experiences
  resources :projects
  resources :otherprojects
  resources :educations
  resources :reskills
  resources :sections do
    resources :subsections, only: [:new, :create]
  end
  resources :subsections, only:[:index, :edit, :update, :destroy]
  resources :users
end
