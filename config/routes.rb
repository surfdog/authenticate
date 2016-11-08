Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tokens
    end
  end
  constraints subdomain: 'api' do
    scope module: 'api' do
      namespace :v1 do
	resources :tokens
      end 
    end
  end
end
