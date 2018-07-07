class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.belongs_to :arena, foreign_key: true
      t.belongs_to :event_type, foreign_key: true
      t.integer :max_winners
      t.datetime :event_datetime
      t.boolean :is_deleted
      

      t.timestamps
    end
  end
end
