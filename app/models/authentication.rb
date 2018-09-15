class Authentication < ApplicationRecord
  belongs_to :user
  require 'date'

  def self.search(id: nil, email: nil)
    with_user_id(id)
    # .with_email(email)
  end


  scope :with_user_id, proc {|id| where(user_id: id).where(is_deleted: false) if id.present?}

  # scope :with_email, proc {|email| where(email: email) if email.present?}

  def timeout(time_then, time_now, session_id = self.session_id)
    p session_id
  end
end
