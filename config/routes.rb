Rails.application.routes.draw do
  devise_for :users

  # Uses the 'high_voltage' gem. Modify app/views/pages/home.html.erb
  get 'pages/home'
end
