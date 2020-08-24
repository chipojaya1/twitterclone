Rails.application.routes.draw do
  resources :blogs do
    collection do
      post :confirm
    end
  end
  
  root to: "blogs#index"
  devise_for :users
end
