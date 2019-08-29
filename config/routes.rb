Rails.application.routes.draw do
  #トップページのルーティング
   root to: 'tasks#index'
   
   #sessionのルーティング
   get 'login' , to: 'sessions#new'
   post 'login', to: 'sessions#create'
   delete 'logout', to: 'sessions#destroy'
   
   
   #ログイン用のルーティング
   get 'signup', to: 'users#new'
   resources :users, only: [:index,:new, :create]
   resources :tasks
end
