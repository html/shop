Shop::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action
  match 'po-tipu/:slug/:page' => 'common#production_by_type', :as => :by_type, :defaults => { :page => 1 }
  match 'po-tipu/:slug/tovar/:id' => 'common#product_by_type', :as => :product_by_type
  match 'proizvoditel/:manufacturer/:page/' => 'common#production_by_manufacturer', :as => :by_manufacturer, :defaults => { :page => 1 }
  match 'proizvoditel/:manufacturer/po-tipu/:slug/:type_page' => 'common#production_by_manufacturer_and_type', :as => :by_manufacturer_and_type, :defaults => { :type_page => 1 }
  match 'proizvoditel/:manufacturer/tovar/:id' => 'common#product_by_manufacturer', :as => :product_by_manufacturer
  match 'proizvoditel/:manufacturer/:slug/tovar/:id' => 'common#product_by_manufacturer_and_type', :as => :product_by_manufacturer_and_type
  match 'articles' => 'common#articles', :as => :articles
  root :to => 'common#main'
  match '/checkout' => 'checkout#update', :state => 'address', :as => :checkout
  match '/admin/all_products' => "admin/products#index", :as => :admin_all_products, :defaults => { "display_all" => true }

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
