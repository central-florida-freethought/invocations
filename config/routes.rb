Rails.application.routes.draw do
<<<<<<< HEAD
  get 'speakers/search'
=======
  get 'volunteers/pending'
>>>>>>> Added ability to activate/deactivate volunteers --skip-ci

  devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do
    patch ':id/activate', to: 'registrations#activate', as: 'activate_user'
    patch ':id/deactivate', to: 'registrations#deactivate', as: 'deactivate_user'
  end

  resources :user_meetings
  resources :user_meetings_steps
  resources :localities

  get 'volunteers/inactive', as: :inactive_volunteers
  get 'volunteers/active', as: :active_volunteers
<<<<<<< HEAD
  get 'cukes', to: 'cukes#index', as: :cukes
=======
>>>>>>> Added ability to activate/deactivate volunteers --skip-ci

  # Uses the 'high_voltage' gem. Modify app/views/pages/home.html.erb
  get 'pages/home'
end
