Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :user_meetings
  resources :user_meetings_steps
  resources :localities

  # Uses the 'high_voltage' gem. Modify app/views/pages/home.html.erb
  get 'pages/home'
end
