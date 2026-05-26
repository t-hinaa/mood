class MoodEntry < ApplicationRecord
  belongs_to :user,optional: true 

  # バリデーション
  validates :mood_level, presence: true, inclusion: { in: 1..5 }
  validates :recorded_at, presence: true

  # 気分レベルに対応する絵文字を返すメソッド
  def mood_emoji
    case mood_level
    when 1 then "very_happy"
    when 2 then "happy"
    when 3 then "clam"
    when 4 then "neutral"
    when 5 then "anxious"
    when 6 then "sad"
    when 7 then "angry"
    when 8 then "very_sad"
    end
  end

end