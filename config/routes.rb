Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'ticket_viewer#index'
  post '/singleticket',  to: 'ticket_viewer#singleticket'
  get '/singleticket',  to: 'ticket_viewer#singleticket'
  
  get '/alltickets', to: 'ticket_viewer#alltickets'
  
  
end
