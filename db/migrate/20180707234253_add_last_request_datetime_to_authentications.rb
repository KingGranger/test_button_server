class AddLastRequestDatetimeToAuthentications < ActiveRecord::Migration[5.1]
  def change
    add_column :authentications, :last_request_datetime, :datetime
  end
end
