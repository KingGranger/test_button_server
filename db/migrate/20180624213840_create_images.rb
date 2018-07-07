class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.binary :image_data
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
