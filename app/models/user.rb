class User < ApplicationRecord
  has_many :drawings
  has_secure_password

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create, uniqueness: true
  validates :username, uniqueness: true

  def self.search(username: nil, id: nil)
    with_username(username).with_id(id)
  end

  scope :with_username, proc {|username| where(username: username) if username.present?}

  scope :with_id, proc {|id| where(id: id) if id.present?}

  # scope :with_password, proc {|password| where(password_digest: password) if password.present?}

  def get_random_ticket_number id, phone_number
    alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    prefix = id <= 26 ? alphabet[id-1]: alphabet[(id % 26) -1]
    number = phone_number.to_s.split("").map{|i| i.to_i}.inject(:+) * id
    prefix + number.to_s
  end
  #have to create a raffle class where the raffle belongs to the user and the user has one raffle
end
