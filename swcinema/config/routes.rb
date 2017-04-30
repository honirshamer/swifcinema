Rails.application.routes.draw do
  get 'admins/:id/seat', to: 'admins#seat', as: 'admins_seat'
  get 'admins/:id/:count/pay', to: 'admins#pay', as: 'admins_pay'
  put 'admins/:id', to: 'admins#upseat'
  get 'admins/home'
  post 'admins/:id/:count/change', to: 'admins#change', as: 'admins_change', :constraints => { :total => /.[^\/]+/, :pay => /.[^\/]+/ }
  root to:"admins#home"
  resources :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
