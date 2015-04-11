Rails.application.routes.draw do

  devise_for :users, :controllers => {sessions: 'sessions',
                                      registrations: 'registrations'}
  root 'movies#index'

  resources :movies, only: [:index, :show]
end
