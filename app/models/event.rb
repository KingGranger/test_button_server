class Event < ApplicationRecord
  belongs_to :arena
  belongs_to :event_type

  has_many :drawings

  require 'date'

  def self.search(id: nil, is_deleted: nil)
    with_id(id)
    # .with_is_deleted(is_deleted)
  end

  scope :with_id, proc {|id| where(id: id).where(is_deleted: false) if id.present?}

  def self.get_events_for_arena_proc(arena, start_date, end_date)
    sql = "SELECT e.arena_id, e.event_type_id, e.max_winners, e.event_datetime, et.event_description
    FROM events e
    JOIN event_types et ON e.event_type_id = et.id
    WHERE e.arena_id = #{arena.id} and e.is_deleted = #{false} and e.event_datetime <= " + "2018-08-26" + " and e.event_datetime >= " + "2018-08-26"
    ActiveRecord::Base.connection.execute(sql)
  end

  # scope :with_is_deleted, proc {|is_deleted| where(is_deleted: false)}

end
