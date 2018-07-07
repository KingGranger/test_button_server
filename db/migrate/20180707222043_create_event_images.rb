class CreateEventImages < ActiveRecord::Migration[5.1]
  def change
    create_table :event_images do |t|
      t.belongs_to :event, foreign_key: true
      t.belongs_to :image, foreign_key: true

      t.timestamps
    end
  end
end
