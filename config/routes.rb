Rails.application.routes.draw do
  get 'speakers/search'
  get 'volunteers/pending'
  get 'volunteers/inactive', as: :inactive_volunteers
  get 'volunteers/active', as: :active_volunteers
  get 'volunteers/:id', to: 'volunteers#show', as: 'volunteer'
  get 'speakers/:id', to: 'speakers#show', as: 'speaker'
  get 'org/:id', to: 'organizations#show', as: :org

  devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do
    patch ':id/activate', to: 'registrations#activate', as: 'activate_user'
    patch ':id/deactivate', to: 'registrations#deactivate', as: 'deactivate_user'
  end

  resources :user_meetings do
    member do
      patch 'approve'
    end
  end
  resources :user_meetings_steps
  resources :localities do
    member do
      get 'report'
    end
    collection do
      get 'report_all'
    end
  end
  
  get 'cukes', to: 'cukes#index', as: :cukes

  # Uses the 'high_voltage' gem. Modify app/views/pages/home.html.erb
  get 'pages/home'
end
