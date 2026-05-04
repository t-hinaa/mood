class ApplicationController < ActionController::Base
  before_action :ensure_session_id

  private

  # セッションIDがない場合は生成する
  def ensure_session_id
    session[:guest_id] ||= SecureRandom.uuid
  end

  # 現在のユーザーまたはゲストIDを取得
  def current_user_or_guest_id
    current_user&.id || session[:guest_id]
  end
end
