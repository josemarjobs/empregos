Empregos::Application.routes.draw do
  get "session/new"
	get "/vagas/para/:perfil" =>'vagas#index', :as=>'vagas_para'
	get "/meus_dados" => 'empresas#meusdados', :as=>'meus_dados'
  resources :empresas do
		resources :perfis do
			resources :vagas		
		end
  end

  resources :vagas
  resources :sessions

	match '/home' => 'pages#home', :as=>'home'
	get '/anunciar' =>'vagas#new', :as => 'anunciar'

	match "/log_out" => "sessions#destroy", :as => "log_out"
	match "/log_in" => "sessions#new", :as => "log_in"
	match "/log_in_anunciar" => "sessions#create_anunciar", :as => "log_in_anunciar"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

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
  #       get 'sold'empresa_perfi_vagas
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
   root :to => "pages#home"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
