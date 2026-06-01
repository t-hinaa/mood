class MoodEntriesController < ApplicationController
    # 新規作成画面
    def new
        @mood_entry = MoodEntry.new
        @mood_entry.recorded_at = Time.current
    end

    # 作成処理(ログインなしでも動く)
    def create
        @mood_entry = MoodEntry.new(mood_entry_params)
    
        if @mood_entry.save
          # セッションに記録IDを保存（ログイン前の記録を追跡）
          session[:mood_entry_ids] ||= []
          session[:mood_entry_ids] << @mood_entry.id
      
          redirect_to mood_entries_path, notice: '気分を記録しました！'
        else
          render :new, status: :unprocessable_entity
        end
    end

    # 気分一覧画面
    def index
        # セッションに保存された記録IDから取得
        entry_ids = session[:mood_entry_ids] || []
        @mood_entries = MoodEntry.where(id: entry_ids).order(recorded_at: :desc)
    end

    # カレンダー表示
    def calendar
      @year = params[:year]&.to_i || Date.today.year
      @month = params[:month]&.to_i || Date.today.month
    
      # 月初と月末を取得
      start_date = Date.new(@year, @month, 1)
      end_date = start_date.end_of_month

      # セッションに保存された記録IDから取得
      entry_ids = session[:mood_entry_ids] || []
      @mood_entries = MoodEntry.where(id: entry_ids)
                              .where(recorded_at: start_date..end_date)
                              .index_by { |entry| entry.recorded_at.to_date }
    end

    private

    def mood_entry_params
      params.require(:mood_entry).permit(:emotion_type, :note, :recorded_at)
    end
end
