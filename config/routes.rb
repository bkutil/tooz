Rails.application.routes.draw do
  controller :static_pages do
    get :cart
    get :index
  end

  root "static_pages#index"
end
