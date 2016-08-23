Rails.application.routes.draw do
  
  resources :d_dungeoneers
  resources :s_skills
  resources :c_classes

  root 'c_classes#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
