class AddSessionIdToAuthentications < ActiveRecord::Migration[5.1]
  def change
    add_column :authentications, :session_id, :string
  end
end
