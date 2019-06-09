Rails.application.routes.draw do
  namespace :cart do
    get :show
    post :add
    post :remove
    delete :drop_item
  end

  controller :static_pages do
    get :index
  end

  root "static_pages#index"
end
