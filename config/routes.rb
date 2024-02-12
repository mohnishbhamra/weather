Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'weather#landing'
  get 'weather', to: 'weather#show'
end
