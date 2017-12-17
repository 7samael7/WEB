class Lesson < ApplicationRecord
  belongs_to :room
  belongs_to :teacher
  belongs_to :course

  validates :duration, presence: true, numericality: { only_integer: true }


  before_validation :calculate_end_time
  validate :check_for_time_collisions

  def self.this_week
    if Time.zone.now.wday != 0
      where start_at: ((Time.zone.now.beginning_of_week - 1.day)..(Time.zone.now.end_of_week - 1.day))
    else
      where start_at: (Time.zone.now.beginning_of_day..(Time.zone.now.beginning_of_day + 7.days))
    end
  end

  def self.today
    where start_at: (Time.zone.now.beginning_of_day..(Time.zone.now.beginning_of_day))
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

  def check_for_time_collisions
    lessons_this_week = room.lessons.this_week
    lessons_this_week.each do |lesson|
      if collide?(lesson)
        errors.add(:start_at, 'lesson collision')
      end
    end
  end

  def collide?(lesson)
    (start_at..end_at).overlaps?(lesson.start_at..lesson.end_at)
  end

  def calculate_end_time
    self.end_at = start_at + duration.hour.seconds
  end
end



=begin
 def this_week
    where start_at: (start_at.beginning_of_week..start_at.end_of_week)
 end
=end