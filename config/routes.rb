Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'

  resources :tasks, only: :index do
    member do
      Task.state_machine.events.each { |e| post(e.name) }
    end
  end
end
