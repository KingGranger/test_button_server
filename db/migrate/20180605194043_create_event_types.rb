class CreateEventTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :event_types do |t|
      t.string :event_description
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
