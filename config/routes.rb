Rails.application.routes.draw do
  root 'welcome#index'

  get 'welcome/index'

  resources :magazines do
    get :export, on: :member
  end
end
