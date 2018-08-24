class EventType < ApplicationRecord
  has_many :events

  def self.search(id: nil, is_deleted: nil)
    with_id(id).with_is_deleted(is_deleted)
  end

  scope :with_id, proc {|id| where(id: id) if id.present?}

  scope :with_is_deleted, proc {|is_deleted| where(is_deleted: is_deleted) if is_deleted.present?}

end
