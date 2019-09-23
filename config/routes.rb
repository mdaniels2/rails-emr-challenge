Rails.application.routes.draw do
  resources :patient, only: [:show, :create], controller: :patients do
    resource :treatments, only: [:show, :create]
    resource :diagnoses, only: [:show, :create], controller: :patient_diagnoses
    resource :visits, only: [:show, :create]
  end
  resources :patients, only: :index
  get 'medications', to: 'medications#index'
  get 'diagnoses', to: 'diagnoses#index'
end
