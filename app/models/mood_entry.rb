class MoodEntry < ApplicationRecord
  belongs_to :user,optional: true 

  # バリデーション
  validates :emotion_type, presence: true
  validates :recorded_at, presence: true

  # 気分レベル
  enum :emotion_type,{
    joy: 10,
    reassurance: 20,
    surprise: 30,
    anticipation: 40,
    apprehension: 50,
    sad: 60,
    angry: 70,
    disgust: 80 
  }

  # SVGのクラス名を返すメソッド
  def emotion_class
    emotion_type
  end
end