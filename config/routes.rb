Rails.application.routes.draw do
  devise_for :admins,defaults: { format: :json }
  namespace :api do
    namespace :v1 do
      resources :templates
      resources :projects
    end
  end
  devise_for :users,defaults: { format: :json },
    path: '',
               path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
                 registration: 'signup'
               },
               controllers: {
                 sessions: 'sessions',
                 registrations: 'registrations',
                 passwords: 'passwords'
               }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
