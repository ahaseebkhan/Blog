Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "users", to: "devise/sessions#new"
    
    unauthenticated :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end

    authenticated :user do
      root to: 'groups#index', as: :authenticated_root
    end
  end

  resources :groups do
    post :join
    delete :leave
    
    resources :posts, controller: 'groups/posts'
  end

  resources :posts, only: [:show, :update, :create, :destroy] do
    resources :comments, module: :posts
  end

  resources :comments do
    resources :comments, module: :comments
  end

  # resources :comments

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "groups#index"
end
