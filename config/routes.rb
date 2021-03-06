Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'


  resources :notes do
  	resources :tags, shallow: true
  end

  get '/search/title/:title' => 'search#by_title'
  get '/search/content/:content' => 'search#by_content'
  get '/search/tag/:tag' => 'search#by_tag'

end
