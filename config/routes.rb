ActionController::Routing::Routes.draw do |map|
# Manage Area
  map.namespace :manage do |manage|
    manage.root :controller => :base, :action => :index

  manage.resources :contacts
  manage.resources :links
  manage.resources :articles
  manage.resources :histories
  manage.resources :comments
  manage.resources :people
  manage.resources :students
  manage.resources :degrees
  manage.resources :positions
  manage.resources :disciplines
  manage.resources :specialities
  manage.resources :disciplines_teachers
  manage.resources :teachers
  manage.resources :diplomas

    map.connect ':controller/:action/:id'
    map.connect ':controller/:action/:id.:format'
    map.connect ':controller/:action.:format'
  end
end
