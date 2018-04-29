Rails.application.routes.draw do
  resource :library, only: :show do
  end
end
