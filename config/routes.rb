Rails.application.routes.draw do
  root 'public#welcome'

  get 'public/welcome'
  get 'public/search'
  get 'public/status'
  get 'public/about'

  get 'public/article/:id', to: 'public#article'

  get 'api/bibliography'
  get 'api/status_counts'

  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }

  resources :articles do
    get :export, on: :member
  end
  
  resources :issues do
    get :export, on: :member
  end
  
  resources :magazines do
    get :export, on: :member
  end
end
