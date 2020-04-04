Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '', to: 'episodes#index'
  get '/episodes/:id', to: 'episodes#show', as: 'episode'
  get '/characters/:id', to: 'characters#show', as: 'character'
  get '/locations/:id', to: 'locations#show', as: 'location'
end
