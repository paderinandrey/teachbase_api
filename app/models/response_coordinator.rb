class ResponseCoordinator
  def self.get_courses(params = {})
    response = get_open_courses(params)
    return last_saved_courses(params) unless [200, 201].include? response.code

    data = JSON.parse(response.body)
    result = []
    data.each do |hash|
      result << hash['course']
    end

    {
      courses: result,
      status: response.code
    }
  end

  def self.get_open_courses(params)
    params[:access_types] = :open

    Client.get('/course_sessions', params)
  end

  def self.save_courses(params = {})
    response = get_open_courses(params)
    courses = JSON.parse(response.body)
    courses.each do |course|
      new_course = Course.find_or_create_by(course_id: course_params(course)[:course_id])
      new_course.update_attributes(course_params(course))
    end
  end

  def self.last_saved_courses(params)
    {
      courses: Course.where(access_type: :open).limit(params[:per_page]),
      status: 404
    }
  end

  def self.course_params(course)
    {
      name:         course['course']['name'],
      description:  course['course']['description'],
      owner_name:   course['course']['owner_name'],
      trumb_url:    course['course']['thumb_url'],
      total_score:  course['course']['total_score'],
      total_tasks:  course['course']['total_tasks'],
      started_at:   course['started_at'],
      finished_at:  course['finished_at'],
      access_type:  course['access_type'],
      course_id:    course['course_id']
    }
  end
end
