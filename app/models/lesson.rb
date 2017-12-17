class Lesson < ApplicationRecord
  belongs_to :room
  belongs_to :teacher
  belongs_to :course

  before_create :calculate_end_time

  #scope :this_week, where start_at: (Time.zone.now.beginning_of_week..Time.zone.now.end_of_week)
  def self.this_week
    where start_at: (Time.zone.now.beginning_of_week..Time.zone.now.end_of_week)
  end

  def day
    start_at.wday
  end

  def day_of_week
    Date::DAYNAMES[day]
  end

  def in_hour?(hour)
    start_at.hour <= hour && end_at.hour > hour
  end


  private

  def calculate_end_time
    self.end_at = start_at + duration.hour.seconds
  end
end



=begin
 def this_week
    where start_at: (start_at.beginning_of_week..start_at.end_of_week)
 end
=end