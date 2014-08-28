Rails.application.routes.draw do
  get 'speakers/search'

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :user_meetings
  resources :user_meetings_steps
  resources :localities do
    member do
      get 'report'
    end
    collection do
      get 'report_all'
    end
  end

  get 'volunteers/inactive', as: :inactive_volunteers
  get 'volunteers/active', as: :active_volunteers
  get 'cukes', to: 'cukes#index', as: :cukes

  # Uses the 'high_voltage' gem. Modify app/views/pages/home.html.erb
  get 'pages/home'
end
