Rails.application.routes.draw do
  # Registration, only for routes :create and :new
  get "register" => "register#new", as: "register"
  post "register" => "register#create", as: "new_registration"

  # Projects
  resources :projects

  # Users
  resources :users
end
