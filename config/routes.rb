Rails.application.routes.draw do
  root 'welcome#index'

  get 'welcome/index'

  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }

  resources :magazines do
    get :export, on: :member
  end
end
