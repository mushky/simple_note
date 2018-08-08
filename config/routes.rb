Rails.application.routes.draw do
	resources :notes
  root 'welcome#index'
end
