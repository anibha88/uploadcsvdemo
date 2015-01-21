Rails.application.routes.draw do
  resources :products do 
    collection { post :import} #the "POST" action for import method
  end

  root "products#index"

end
