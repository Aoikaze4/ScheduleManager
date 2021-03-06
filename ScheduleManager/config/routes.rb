Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  get 'top', to: 'homes#top'
  get 'about', to: 'homes#about'

  resources :users, only:[:edit,:update]
  get 'mypage', to: 'users#mypage'

  #イベント参加時

  #resources :event_join_statuses, only:[:create]

  resources :events, only:[:new,:create,:show,:update,:destroy,:edit,:index] do
    resources :comments, only:[:create,:destroy]
    resources :event_join_statuses, only:[:update,:destroy,:create]
  end
end
