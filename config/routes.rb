Icd10forum::Application.routes.draw do

  resources :faqs
  resources :codes
  resources :blocks
  resources :chapters

  root :to => 'chapters#index'
end
