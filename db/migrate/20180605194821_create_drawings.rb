class CreateDrawings < ActiveRecord::Migration[5.1]
  def change
    create_table :drawings do |t|
      t.belongs_to :event, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.boolean :is_drawing_winner
      t.datetime :drawing_datetime
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
