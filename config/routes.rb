ActionController::Routing::Routes.draw do |map|
map.root :controller => "home"
  map.resources :contacts
  map.resources :links
  map.resources :articles
  map.resources :histories
  map.resources :comments
  map.resources :people
  map.resources :students
  map.resources :degrees
  map.resources :positions
  map.resources :disciplines
  map.resources :specialities
  map.resources :disciplines_teachers
  map.resources :teachers
  map.resources :diplomas
  map.resources :groups

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
#User Area
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action.:format'
end
