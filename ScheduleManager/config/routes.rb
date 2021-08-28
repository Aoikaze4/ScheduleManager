Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  get 'top', to: 'homes#top'
  get 'about', to: 'homes#about'

  resources :users, only:[:edit,:update]
  get 'mypage', to: 'users#mypage'


  resources :events, only:[:new,:create,:show,:update,:destroy]
end
