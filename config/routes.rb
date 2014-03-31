VideoBarn::Application.routes.draw do
  resources :categories do
    get 'arenas/:arena', :on => :member, :action => :show
  end

  resources :show_classes

  resources :runs do
    get 'random', :on => :collection
    get 'search', :on => :collection
  end

  resources :videos do 
    get 'bad', :on => :member
  end

  resources :horses

  resources :riders do
    get 'shows/:show_id', :on => :member, :action => :show
  end

  resources :shows do 
    get 'classes/:class_id', :on => :member, :action => :show
  end

  resources :users,    only: [:new, :create, :show, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]

  match '/signup',  to: 'users#new',        via: 'get'
  match '/signin',  to: 'sessions#new',     via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  root to: 'sessions#new'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
#== Route Map
# Generated on 31 Mar 2014 15:41
#
#                 GET    /categories/:id/arenas/:arena(.:format) categories#show
#      categories GET    /categories(.:format)                   categories#index
#                 POST   /categories(.:format)                   categories#create
#    new_category GET    /categories/new(.:format)               categories#new
#   edit_category GET    /categories/:id/edit(.:format)          categories#edit
#        category GET    /categories/:id(.:format)               categories#show
#                 PATCH  /categories/:id(.:format)               categories#update
#                 PUT    /categories/:id(.:format)               categories#update
#                 DELETE /categories/:id(.:format)               categories#destroy
#    show_classes GET    /show_classes(.:format)                 show_classes#index
#                 POST   /show_classes(.:format)                 show_classes#create
#  new_show_class GET    /show_classes/new(.:format)             show_classes#new
# edit_show_class GET    /show_classes/:id/edit(.:format)        show_classes#edit
#      show_class GET    /show_classes/:id(.:format)             show_classes#show
#                 PATCH  /show_classes/:id(.:format)             show_classes#update
#                 PUT    /show_classes/:id(.:format)             show_classes#update
#                 DELETE /show_classes/:id(.:format)             show_classes#destroy
#     random_runs GET    /runs/random(.:format)                  runs#random
#     search_runs GET    /runs/search(.:format)                  runs#search
#            runs GET    /runs(.:format)                         runs#index
#                 POST   /runs(.:format)                         runs#create
#         new_run GET    /runs/new(.:format)                     runs#new
#        edit_run GET    /runs/:id/edit(.:format)                runs#edit
#             run GET    /runs/:id(.:format)                     runs#show
#                 PATCH  /runs/:id(.:format)                     runs#update
#                 PUT    /runs/:id(.:format)                     runs#update
#                 DELETE /runs/:id(.:format)                     runs#destroy
#       bad_video GET    /videos/:id/bad(.:format)               videos#bad
#          videos GET    /videos(.:format)                       videos#index
#                 POST   /videos(.:format)                       videos#create
#       new_video GET    /videos/new(.:format)                   videos#new
#      edit_video GET    /videos/:id/edit(.:format)              videos#edit
#           video GET    /videos/:id(.:format)                   videos#show
#                 PATCH  /videos/:id(.:format)                   videos#update
#                 PUT    /videos/:id(.:format)                   videos#update
#                 DELETE /videos/:id(.:format)                   videos#destroy
#          horses GET    /horses(.:format)                       horses#index
#                 POST   /horses(.:format)                       horses#create
#       new_horse GET    /horses/new(.:format)                   horses#new
#      edit_horse GET    /horses/:id/edit(.:format)              horses#edit
#           horse GET    /horses/:id(.:format)                   horses#show
#                 PATCH  /horses/:id(.:format)                   horses#update
#                 PUT    /horses/:id(.:format)                   horses#update
#                 DELETE /horses/:id(.:format)                   horses#destroy
#                 GET    /riders/:id/shows/:show_id(.:format)    riders#show
#          riders GET    /riders(.:format)                       riders#index
#                 POST   /riders(.:format)                       riders#create
#       new_rider GET    /riders/new(.:format)                   riders#new
#      edit_rider GET    /riders/:id/edit(.:format)              riders#edit
#           rider GET    /riders/:id(.:format)                   riders#show
#                 PATCH  /riders/:id(.:format)                   riders#update
#                 PUT    /riders/:id(.:format)                   riders#update
#                 DELETE /riders/:id(.:format)                   riders#destroy
#                 GET    /shows/:id/classes/:class_id(.:format)  shows#show
#           shows GET    /shows(.:format)                        shows#index
#                 POST   /shows(.:format)                        shows#create
#        new_show GET    /shows/new(.:format)                    shows#new
#       edit_show GET    /shows/:id/edit(.:format)               shows#edit
#            show GET    /shows/:id(.:format)                    shows#show
#                 PATCH  /shows/:id(.:format)                    shows#update
#                 PUT    /shows/:id(.:format)                    shows#update
#                 DELETE /shows/:id(.:format)                    shows#destroy
#           users POST   /users(.:format)                        users#create
#        new_user GET    /users/new(.:format)                    users#new
#       edit_user GET    /users/:id/edit(.:format)               users#edit
#            user GET    /users/:id(.:format)                    users#show
#        sessions POST   /sessions(.:format)                     sessions#create
#     new_session GET    /sessions/new(.:format)                 sessions#new
#         session DELETE /sessions/:id(.:format)                 sessions#destroy
#          signup GET    /signup(.:format)                       users#new
#          signin GET    /signin(.:format)                       sessions#new
#         signout DELETE /signout(.:format)                      sessions#destroy
#            root GET    /                                       sessions#new
