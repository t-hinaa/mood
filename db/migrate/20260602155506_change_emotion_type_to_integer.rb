class ChangeEmotionTypeToInteger < ActiveRecord::Migration[8.1]
  def up
    # カラムが存在するか確認してから処理
    if column_exists?(:mood_entries, :emotion_type)
      # 既存のデータを削除
      MoodEntry.delete_all
      
      # カラムの型を変更
      change_column :mood_entries, :emotion_type, :integer
    else
      # カラムが存在しない場合は新規追加
      add_column :mood_entries, :emotion_type, :integer
    end
  end

  def down
    # ロールバック時の処理
    if column_exists?(:mood_entries, :emotion_type)
      change_column :mood_entries, :emotion_type, :string
    else
      remove_column :mood_entries, :emotion_type
    end
  end
end
