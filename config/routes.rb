Rails.application.routes.draw do
  namespace :api do
    post "/sessions" => "sessions#create"

    get '/users' => 'users#index'
    post "/users" => "users#create"
    get "/users/:id" => "users#show"
    patch "/users/:id" => "users#update"

    get '/events' => 'events#index'
    post 'events' => 'events#create'
    get '/events/:id' => 'events#show'

    post '/images' => 'images#create'
    patch '/images/:id' => 'images#update'
    delete '/images/:id' => 'images#destroy'

    #don't need a user_events index page because we will display all user_events with user.user_events, displaying all user_events associated with that user. 
    get '/user_events' => 'user_events#index'
    post '/user_events' => 'user_events#create'
    get '/user_events/:id' => 'user_events#show'
    patch '/user_events/:id' => 'user_events#update'
    delete '/user_events/:id' => 'user_events#destroy'

    post '/requests' => 'requests#create'
    get '/requests/:id' => 'requests#show'
    patch '/requests/:id' => 'requests#update'
    delete '/requests/:id' => 'requests#destroy'

    #will not need a group index beacuse of event.groups?
    get '/groups' => 'groups#index'
    post '/groups' => 'groups#create'
    get '/groups/:id' => 'groups#show'
    patch '/groups/:id' => 'groups#update'
    delete '/groups/:id' => 'groups#destroy'

  end
end
