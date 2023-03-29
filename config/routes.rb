Rails.application.routes.draw do
  get 'line_items/new'
  get 'line_items/create'
  root to: "pages#home"
  
  get 'pages/home'

  devise_for :users

  resources :quotes
  
  resources :quotes do
    resources :line_item_dates, except: [:index, :show]
  end  
  
  resources :quotes do
    resources :line_item_dates, except: [:index, :show] do
      resources :line_items, except: [:index, :show]
    end
  end   
end
