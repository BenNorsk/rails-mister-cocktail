Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => redirect('/cocktails')
  resources :cocktails do
    resources :doses, only: []

  end
end
