class MoodEntry < ApplicationRecord
  belongs_to :user,optional: true 

  # バリデーション
  validates :mood_level, presence: true, inclusion: { in: 1..5 }
  validates :recorded_at, presence: true

  # 気分レベルに対応する絵文字を返すメソッド
  def mood_emoji
    case mood_level
    when 1 then "喜"
    when 2 then "安心"
    when 3 then "不安"
    when 4 then "驚"
    when 5 then "悲"
    when 6 then "不快"
    when 7 then "怒"
    when 8 then "期待"
    end
  end

end