HbNote::Application.routes.draw do
  

  get "admin/index"
  get "/admin", to: "admin#index"
  get "admin/:username", to: "admin#user", as: "admin_user"
  get "admin/post"
  # NEED TO CHANGE TO USERNAME
  get "/blog/:username", to: "blog#index"
  put "admin/:username"
  # get "/blog/:id/d" to: "blog#show"
  get "blog/show"
  devise_for :users
  get "site/index"

  # root :to => "notebooks#index", :constraints => {user_signed_in?}
  root 'site#index'

  resources :notebooks do
    resources :notes
  end

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
