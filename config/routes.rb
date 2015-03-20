Rails.application.routes.draw do
  get "signin" => "session#new", as: "signin"
  post "login" => "session#create", as: "login"
  delete "logout" => "session#foo", as: "logout"

  # Registration, only for routes :create and :new
  get "register" => "register#new", as: "register"
  post "register" => "register#create", as: "new_registration"

  # Projects
  resources :projects do
    #todo lists
    resources :todo_lists, only: [:create, :update, :destroy, :show] do
      resources :todos, only: [:create, :update, :destroy]
    end
  end

  # Users
  resources :users, only: [:edit, :update, :destroy]
end
