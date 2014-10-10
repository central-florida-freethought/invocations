Rails.application.routes.draw do
  get 'speakers/search'
  get 'volunteers/pending'
  get 'volunteers/inactive', as: :inactive_volunteers
  get 'volunteers/active', as: :active_volunteers
  get 'speakers/:id', to: 'speakers#show', as: 'speaker'
  get 'org/:id', to: 'organizations#show', as: :org
  get 'user_meetings/pending', as: :pending_meetings
  get 'user_meetings', to: 'user_meetings#index', as: :user_meetings
  get 'user_meetings/admin', to: 'user_meetings#admin', as: :admin_user_meetings

  devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do
    patch ':id/activate', to: 'registrations#activate', as: 'activate_user'
    patch ':id/deactivate', to: 'registrations#deactivate', as: 'deactivate_user'
  end

  resources :volunteers

  resources :user_meetings_steps
  resources :localities do
    member do
      get 'report'
    end
    collection do
      get 'report_all'
    end
    resources :user_meetings, shallow: true do
      member do
        patch 'approve'
        patch 'deny'
        patch 'review'
      end
    end
  end

  get 'cukes', to: 'cukes#index', as: :cukes

  # Contact Form
  get 'contact' => 'contact_form#new'
  post 'contact' => 'contact_form#create'

  # Uses the 'high_voltage' gem. Modify app/views/pages/home.html.erb
  get 'pages/home'
end

