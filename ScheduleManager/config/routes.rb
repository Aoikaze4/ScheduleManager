Rails.application.routes.draw do
  devise_for :users, only: [:sign_up,:sign_in,:sign_out,:session]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  get 'top', to: 'homes#top'
  get 'about', to: 'homes#about'

  resources :users, only:[:show,:edit,:update]

end
