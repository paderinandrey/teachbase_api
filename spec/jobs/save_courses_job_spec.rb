require 'rails_helper'

RSpec.describe SaveCoursesJob, type: :job do
  it 'Save courses into the database' do
    expect(ResponseCoordinator).to receive(:save_courses).and_call_original
    SaveCoursesJob.perform_now
  end
end
