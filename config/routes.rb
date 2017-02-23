Rails.application.routes.draw do
  devise_for :users
  root :to => "polls#index"
  put '/polls/:id/saving', :to => 'polls#save', :as => "save_poll"
  resources :polls do
  	resources :questions
  end
end
