class MoodEntry < ApplicationRecord
  belongs_to :user,optional: true 

  # バリデーション
  validates :emotion_type, presence: true
  validates :recorded_at, presence: true

  # 気分レベル
  enum emotion_type: {
    very_happy: 'very_happy',
    happy: 'happy',
    calm: 'calm',
    neutral: 'neutral',
    anxious: 'anxious',
    sad: 'sad',
    angry: 'angry',
    very_sad: 'very_sad'
  }

  # SVGのクラス名を返すメソッド
  def emotion_class
    emotion_type
  end
end