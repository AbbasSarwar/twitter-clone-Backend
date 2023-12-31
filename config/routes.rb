Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :likes
      resources :comments
      resources :tweets
    end
  end
  resources :twitters
  get 'private/test'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations"
  }
end
