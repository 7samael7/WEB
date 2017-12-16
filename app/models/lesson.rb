class Lesson < ApplicationRecord
  belongs_to :room
  belongs_to :teacher
  belongs_to :course

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

end



=begin
 def this_week
    where start_at: (start_at.beginning_of_week..start_at.end_of_week)
 end
=end