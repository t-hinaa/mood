class MoodEntry < ApplicationRecord
  belongs_to :user,optional: true 

  # バリデーション
  validates :mood_level, presence: true, inclusion: { in: 1..5 }
  validates :recorded_at, presence: true

  # 気分レベルに対応する絵文字を返すメソッド
  def mood_emoji
    case mood_level
    when 1 then ""
    when 2 then 
    when 3 then 
    when 4 then 
    when 5 then 
    when 6 then 
    when 7 then 
    when 8 then 
    end
  end

end