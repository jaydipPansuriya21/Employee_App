Rails.application.routes.draw do
  root 'employee#index'
  get '/employee/edit_department/:id', to: 'employee#edit_department', as: 'edit_department'
  post '/employee/update_department', to: 'employee#update_department'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
