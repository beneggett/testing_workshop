Rails.application.routes.draw do

  root 'static#home'

  get "/sign-up", to: "registrations#new", as: :sign_up
  post "/sign-up", to: "registrations#create", as: :register
  get "/sign-in", to: "sessions#new", as: :sign_in
  post "/sign-in", to: "sessions#create", as: :create_session
  delete "/sign-out", to: "sessions#destroy", as: :sign_out

  get '/activities/:id/complete', to: "activities#complete", as: :complete_activity
  get '/activities/:id/incomplete', to: "activities#incomplete", as: :incomplete_activity
end
