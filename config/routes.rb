Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :freelancers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'clients#index'

  resources :clients do
    resources :projects do
      resources :deadlines
    end
  end
  resources :freelancers
  get '/:notable_type/:notable_id/note', to: 'notes#new', as: :new_note
  post '/:notable_type/:notable_id/note', to: 'notes#create', as: :notes

  get '/:source_type/:source_id/document', to: 'documents#new', as: :new_document
  post '/:source_type/:source_id/document', to: 'documents#create', as: :documents
end
