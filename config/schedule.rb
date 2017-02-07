every 20.minutes do
  runner 'SaveCoursesJob.perform_now'
end
