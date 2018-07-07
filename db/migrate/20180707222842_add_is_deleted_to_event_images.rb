class AddIsDeletedToEventImages < ActiveRecord::Migration[5.1]
  def change
    add_column :event_images, :is_deleted, :boolean
  end
end
