class CreateArenas < ActiveRecord::Migration[5.1]
  def change
    create_table :arenas do |t|
      t.string :arena_name
      t.string :city
      t.string :state
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
