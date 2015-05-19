Job::Application.routes.draw do

 resources :posaos
 root "posaos#index"

end
