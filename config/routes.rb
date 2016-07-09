Rails.application.routes.draw do
  # resources :aggregates
  resources :twitter
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'twitter#new';
end
