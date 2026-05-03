class CreateMoodEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :mood_entries do |t|
      t.references :user, null: true, foreign_key: true
      t.integer :mood_level, null: false
      t.text :note
      t.datetime :recorded_at, null: false

      t.timestamps
    end
  end
end
