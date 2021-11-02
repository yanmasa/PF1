Rails.application.routes.draw do
  devise_for :recipients, skip: [:registrations,:passwords], controllers: {
    sessions: 'recipient/sessions'
  }
  devise_for :contributors, skip: [:passwords], controllers: {
    registrations: 'contributor/registrations',
    sessions: 'contributor/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
end
