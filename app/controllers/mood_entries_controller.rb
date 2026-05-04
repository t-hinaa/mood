class MoodEntriesController < ApplicationController
    # 新規作成画面
    def new
        @mood_entry = MoodEntry.new
        @mood_entry.recorded_at = Time.current
    end

    # 作成処理
    def create
        @mood_entry = MoodEntry.new(mood_entry_params)
    
        # ログインしている場合は user_id をセット
        # ログインしていない場合は user_id は nil のまま
        @mood_entry.user_id = current_user&.id if defined?(current_user)
    
        if @mood_entry.save
          # セッションに記録IDを保存（後で自分の記録を取得するため）
          session[:mood_entry_ids] ||= []
          session[:mood_entry_ids] << @mood_entry.id
      
          redirect_to mood_entries_path, notice: '気分を記録しました！'
        else
          render :new, status: :unprocessable_entity
        end
    end

    # 一覧画面
    def index
        # ログインしている場合はそのユーザーの記録
        # ログインしていない場合はセッションに保存された記録IDから取得
        if defined?(current_user) && current_user
          @mood_entries = current_user.mood_entries.order(recorded_at: :desc)
        else
          entry_ids = session[:mood_entry_ids] || []
          @mood_entries = MoodEntry.where(id: entry_ids).order(recorded_at: :desc)
        end
    end

    private

    def mood_entry_params
        params.require(:mood_entry).permit(:mood_level, :note, :recorded_at)
    end
end
