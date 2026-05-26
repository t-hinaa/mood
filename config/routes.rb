Rails.application.routes.draw do
  root 'top_pages#index' 

  # 匿名セッション作成用
  get 'moods/anonymous', to: 'moods#create_anonymous_session', as: :anonymous_mood

  # 感情記録のメインルーティング
  resources :mood_entries, only: [:index, :show, :new, :create] do
    collection do
      get :calendar  # カレンダー専用ルート
    end
  end
  
  resources :mood_records, only: [:create, :update]

  get "up" => "rails/health#show", as: :rails_health_check

end
