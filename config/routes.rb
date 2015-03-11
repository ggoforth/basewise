Rails.application.routes.draw do
  get "signin" => "session#new", as: "signin"
  post "login" => "session#create", as: "login"
  delete "logout" => "session#foo", as: "logout"

  # Registration, only for routes :create and :new
  get "register" => "register#new", as: "register"
  post "register" => "register#create", as: "new_registration"

  # Projects
  resources :projects

  # Users
  resources :users
end
