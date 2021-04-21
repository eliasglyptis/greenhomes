Rails.application.routes.draw do
  
  root 'pages#home'
  post '/comments', to: 'comments#create'

  resources :projects
  
  devise_for :users, path: '', 
              path_names: { 
                sign_in: 'login', 
                sign_up: 'register', 
                sign_out: 'logout', 
                edit: 'profile' 
              },
              controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
end
