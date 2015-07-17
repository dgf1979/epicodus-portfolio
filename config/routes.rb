Rails.application.routes.draw do
  resources :session, :only => [:create], :defaults => { :format => :json }
  devise_for :users
  resources :blogs do
    resources :comments, :except => [:index, :show]
  end
  # root 'categories#index'
  root :to => redirect('/categories')
  resources :categories do
    resources :projects, :except => [:index]
  end
end
