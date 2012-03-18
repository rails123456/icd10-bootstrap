Icd10forum::Application.routes.draw do

  resources :blocks
  resources :chapters

  root :to => 'chapters#index'
end
