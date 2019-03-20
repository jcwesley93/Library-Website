Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :authors
  resources :books, except: [:update, :destroy]
  patch '/books/:id/addauthor', to: "books#add_author", as: "add_author"
  delete '/books/:id/removeauthor', to: "books#remove_author", as: "remove_author"
end
