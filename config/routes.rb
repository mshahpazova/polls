Rails.application.routes.draw do
  get '/', to: redirect('/polls')
  devise_for :admins
  resources :polls do
    member do
      post :vote
    end
    resources :options, only: [:create, :destroy, :new]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
