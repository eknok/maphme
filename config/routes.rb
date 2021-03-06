Rails.application.routes.draw do
  resources :posts
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  get '/about', to: 'top#about'
  root to: 'top#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
