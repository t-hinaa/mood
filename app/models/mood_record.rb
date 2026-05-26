class MoodRecord < ApplicationRecord
  belongs_to :user
  
  validates :recorded_date, presence: true, uniqueness: { scope: :user_id }
  validates :emotion_type, presence: true

  # emotion_type: 10刻みで8種類の感情を表現
  enum :emotion_type, {
    very_happy: 10,
    happy: 20,
    calm: 30,
    neutral: 40,
    anxious: 50,
    sad: 60,
    angry: 70,
    very_sad: 80
  }
end