class AddIsDeletedToArenaImages < ActiveRecord::Migration[5.1]
  def change
    add_column :arena_images, :is_deleted, :boolean
  end
end
