Rails.application.routes.draw do
  
  resources :line_items

  resources :inquirylists, only: [:show]

  root 'pages#home'

  get 'products' => 'products#index'

  get 'categories/:id/brands/:brand_id' => 'categories#show', as:"categories_in"
  get 'brands/:id/categories/:category_id' => 'brands#show', as:"brands_in"
  get 'categories/:id/:sub_id' => 'categories#showsub', as:"subcategory"
  
  devise_for :customers, :controllers => { registrations: 'registrations' }, :skip => [:sessions]

  as :customer do
    get 'login' => 'devise/sessions#new', :as => :new_customer_session
    post 'login' => 'devise/sessions#create', :as => :customer_session
    delete 'logout' => 'devise/sessions#destroy', :as => :destroy_customer_session
  end

  namespace :admin do
    get 'login' => 'sessions#new', :as => 'login'
    get "logout" => 'sessions#destroy', :as => "logout"
  end

  resources "products", only: [:show]
  resources "categories", only: [:show]
  resources "brands", only: [:show]

  get 'contact_us' => 'contacts#new', as:"contact"

  resources 'contacts', only: [:create]

  get :send_inquiry_mail, to: 'inquirylists#send_inquiry_mail', as: :send_inquiry_mail

  get 'about' => 'pages#about'

  namespace :admin do
    resources "informations"
  end

  namespace :admin do
    resources :products, :categories, :brands, :users, :customers
    resources "sessions", only: [:new, :create]
  end

  get "admin/categories/:id/sub/new" => 'admin/categories#newsub', :as => :new_admin_subcategory
  post "admin/categories/:id/sub/new" => 'admin/categories#createsub'
  get "admin/categories/:id/subs" => 'admin/categories#indexsub', :as => :admin_subcategories
  get "admin/categories/:id/subs/:sub_id" => 'admin/categories#showsub', :as => :admin_subcategory
  get "admin/categories/:id/subs/:sub_id/edit" => 'admin/categories#editsub', :as => :edit_admin_subcategory
  patch "admin/categories/:id/subs/:sub_id/edit" => 'admin/categories#updatesub'
  delete "admin/categories/:id/subs/:sub_id" => 'admin/categories#destroysub'

  delete "inquirylists/:id/destroy_all" => 'line_items#destroy_all'
end
