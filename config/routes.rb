Rails.application.routes.draw do
   root to: 'tasks#index'
   root to: 'toppages#index'
   
   #sessionのルーティング
   get 'login' , to: 'sessions#new'
   post 'login', to: 'sessions#create'
   delete 'logout', to: 'sesions#destroy'
   
   
   #ログイン用のルーティング
   get 'signup', to: 'users#new'
   resources :users, only: [:index, :show, :new, :create]
   resources :tasks
end
