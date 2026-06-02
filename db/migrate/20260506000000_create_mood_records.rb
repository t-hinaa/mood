class CreateMoodRecords < ActiveRecord::Migration[8.1]
  def change
    create_table :mood_records do |t|
      t.references :user, foreign_key: true
      t.string :emotion_type, null: false  # 感情のタイプ
      t.date :recorded_date, null: false   # 記録した日付
      t.text :note                         # メモ（任意）

      t.timestamps
    end
  end
end
