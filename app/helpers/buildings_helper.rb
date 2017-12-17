module BuildingsHelper

  def room_invocation(lessons)
    html = ''
    8.times do |hour|
      html << "<td>#{find_name(lessons, hour + 8)}</td>"
    end
    html.html_safe
  end

  private

  def find_name(lessons, hour)
    lessons.each do |lesson|
      return "#{lesson.course.title} (#{lesson.course.students.count})" if lesson.in_hour?(hour)
    end
    ""
  end

end
