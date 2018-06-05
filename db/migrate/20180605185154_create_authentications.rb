class CreateAuthentications < ActiveRecord::Migration[5.1]
  def change
    create_table :authentications do |t|
      t.belongs_to :user, foreign_key: true
      t.string :auth_string
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
