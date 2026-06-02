class User < ApplicationRecord
  has_many :mood_entries
  has_many :mood_records, dependent: :destroy
end