Rails.application.routes.draw do
  root 'top_pages#index' 

  # 感情記録のメインルーティング
  resources :mood_entries, only: [:new, :create, :index, :show] do
    collection do
      get :calendar  # カレンダー専用ルート
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

end
