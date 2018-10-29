Rails.application.routes.draw do

root 'tops#top'


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

resources :employees, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
   put :sort
   end
# resources :works, only: [:create, :destroy]
# resources :work_contents, only: [:create]
resources :mannings, only: [:index, :update, :show]
resources :time_tables, only: [:create, :new, :destroy, :index, :edit, :update, :show]
resources :date_tables, only: [:new, :create, :update, :edit]
resources :admins, only: [:create, :update, :destroy]
get'time_tables/manning_edit/:id/check' => 'time_tables#manning_edit',as: 'manning_edit'
patch 'time_tables/manning/:id' => 'time_tables#manning_edit_up', as: 'manning_edit_up'
get'time_tables/time_table_l/check' => 'time_tables#index_l', as: 'time_tables_l'
post'time_tablesaa/:id' => 'time_tables#update', as: 'time_table_update'
post'time_tables/time_table_l/time_tablesaa/:id' => 'time_tables#update', as: 'time_table_updat'





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
