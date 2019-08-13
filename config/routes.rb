Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/new(.:format)', to: 'games#new'
  get '/score(.:format)', to: 'games#score'
end
