Rails.application.routes.draw do
  get 'goodmorning/world'
  resources :members
  resources :fan_comments
  # resources :reviews
  resources :authors
  resources :users
  resources :books, constraints: { id: /[0-9]{1,2}/ } do
    resources :reviews, shallow: true
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  get 'hello/view'
  get 'hello/nothing'
  get 'hello/list'
  get 'hello/app_var'
  get 'view/field'
  get 'view/select'
  get 'view/col_select'
  get 'view/date_select'
  get 'view/col_radio'
  get 'record/find'
  get 'ctr/para' => 'ctr#para'
  get 'ctr/get_xml'
  get 'ctr/cookie'
  get 'ctr/index'
  get 'login/index'
  get 'ajax/index'
  get 'ajax/upanel'
  get 'ajax/search'
  post 'ctr/cookie_rec' => 'ctr#cookie_rec'
  post 'login/auth'
  post 'ajax/result'

  root to: 'books#index'
end
