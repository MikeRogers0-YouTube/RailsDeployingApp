Rails.application.routes.draw do
  resources :comments
  root to: redirect('/comments')
end
