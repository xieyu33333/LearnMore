DataDownload::Application.routes.draw do

  mount RedactorRails::Engine => '/redactor_rails'

  # faye_server '/faye', :timeout => 25 do
  #   map '/message' => PushMessagesController
  #   map default: :block
  # end

  resources :authors

  resources :topics, :only => [:new, :create, :update, :show, :edit]

  resources :comments do
    collection do
      post "create_blog_comment"
    end
  end
  
  resources :blogs do
    collection do
      put "change_classify"    
    end
    resources :comments
  end
  
  devise_for :admins

  devise_for :users

  resources :studyfiles do
    collection do
      get ":id/download", :to => 'studyfiles#download'
      put "change_classify"
    end
  end

  resources :sections do
    collection do
      get "ask_for_section"
      put "pass"
      put "unpass"
    end

    resources :blogs do
      collection do
        get "order"
        get "classify"
      end
    end

    resources :studyfiles do
      collection do
        get "order"
        get "classify"
      end
    end
    
    resources :users
  end

  
  resources :faverates
      
  resources :downloads 

  resources :messages do
    collection do
      delete "delete_all"
    end
  end

  resources :users do
      resources :downloads
      resources :faverates
      resources :studyfiles
      resources :comments
      resources :blogs
      resources :messages
      collection do
        get "search"
      end
    end
  
  delete "/faverates/delete", :to => 'faverates#destroy'
  get "/homes/index"
  get "/homes/all_data"
  #get "sections/ask_for_section", :to => 'sections#ask_for_section'
  match 'blogs/:id/editing' => 'blogs#editing', :constraints => { :id => /\d{1,15}/}
  match 'blogs/:id/no_editing' => 'blogs#no_editing', :constraints => { :id => /\d{1,15}/}
  root :to => 'sections#index'

  namespace :admin do
    resources :users, :only => [:index, :destroy]
    resources :blogs, :only => [:index, :destroy, :edit] do
      collection do
        get "order"
        post "change_theme_order"
        post "change_item_order"
      end
    end
    resources :studyfiles, :only => [:index, :destroy] do
      collection do
        get "order"
        post "change_theme_order"
        post "change_item_order"
      end
    end
    resources :topics, :only => [:index, :destroy]
    resources :comments, :only => [:index, :destroy]
    resources :forums
    resources :sections
    resources :authors, :only => [:index, :destroy]

    match 'authors/:id/pass' => 'authors#pass', :constraints => { :id => /\d{1,15}/}
    match 'sections/:id/pass' => 'sections#pass', :constraints => { :id => /\d{1,15}/}
    match 'sections/:id/unpass' => 'sections#unpass', :constraints => { :id => /\d{1,15}/}
  end

  

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
