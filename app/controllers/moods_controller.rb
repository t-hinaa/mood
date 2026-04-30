class MoodsController < ApplicationController
    def create_anonymous_session
        # Cookieに匿名ユーザーIDを保存
        session[:anonymous_user_id] ||= SecureRandom.uuid
        redirect_to new_mood_path
    end
end