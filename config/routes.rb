Rails.application.routes.draw do
  namespace :api do
    post "/sessions" => "sessions#create"

    post "/users" => "users#create"
    post "/users/:id" => "users#show"
    post "/users/:id" => "users#update"

    get '/events' => 'events#index'
    get '/events' => 'events#show'

    post '/images' => 'images#create'
    patch '/images/:id' => 'images#update'
    delete '/images/:id' => 'images#destroy'

    #don't need a user_events index page because we will display all user_events with user.user_events, displaying all user_events associated with that user. 
    get '/user_events' => 'user_events#create'
    get '/user_events/:id' => 'user_events#show'
    get '/user_events/:id' => 'user_events#update'
    get '/user_events/:id' => 'user_events#destroy'

    get '/requests' => 'requests#create'
    get '/requests/:id' => 'requests#show'
    get '/requests/:id' => 'requests#update'
    get '/requests/:id' => 'requests#destroy'

    get '/groups' => 'groups#index' #will not need a group index beacuse of event.groups?
    get '/groups' => 'groups#create'
    get '/groups/:id' => 'groups#show'
    get '/groups/:id' => 'groups#update'
    get '/groups/:id' => 'groups#destroy'

  end
end
