Rails.application.routes.draw do

   #post 'date_tables/new'
root 'tops#top1'
get '/top' => 'tops#top'

devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :employees, controllers: {
  sessions:      'employees/sessions',
  passwords:     'employees/passwords',
  registrations: 'employees/registrations'
}

resources :employees, only: [:index, :new, :create, :show, :edit, :update, :destroy]
resources :works, only: [:create, :destroy]
resources :work_contents, only: [:create]
resources :mannings, only: [:index, :update, :show]
resources :time_tables, only: [:create, :new, :destroy, :index, :edit, :update, :show]
resources :date_tables, only: [:new, :create, :update, :edit]

patch 'items/:id/check' => 'items#update2',as: 'update2'

resources :admins, only: [:create, :update, :destroy]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
