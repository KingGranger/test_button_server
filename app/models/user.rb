class User < ApplicationRecord
  has_many :drawings
  has_secure_password

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  def get_random_ticket_number id, phone_number
    alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    prefix = id <= 26 ? alphabet[id-1]: alphabet[(id % 26) -1]
    number = phone_number.to_s.split("").map{|i| i.to_i}.inject(:+) * id
    prefix + number.to_s
  end
  #have to create a raffle class where the raffle belongs to the user and the user has one raffle
end
