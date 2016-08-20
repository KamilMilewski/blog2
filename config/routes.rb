Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  #when user refresh post show page with comment adding error on it
  get 'posts/:id/comments', to: 'posts#show'
  #when user refresh comment edit page with comment updating errors on it
  get 'posts/:post_id/comments/:id', to: 'comments#edit'

  resources :posts do
  	resources :comments
  end
end
