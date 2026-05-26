class AddIndexToMoodRecords < ActiveRecord::Migration[8.1]
  def change
    add_index :mood_records, [:user_id, :recorded_date], unique: true
  end
end
