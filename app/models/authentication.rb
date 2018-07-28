class Authentication < ApplicationRecord
  belongs_to :user
require 'date'


  def timeout(time_then, time_now, session_id = self.session_id)
    p session_id

  end
end
