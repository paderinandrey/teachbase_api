class SaveCoursesJob < ActiveJob::Base
  queue_as :default

  def perform
    ResponseCoordinator.save_courses
  end
end
