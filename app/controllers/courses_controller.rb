class CoursesController < ApplicationController
  respond_to :json

  def index
    response = ResponseCoordinator.get_courses(course_params)
    respond_with(response[:courses], status: response[:status])
  end

  private

  def course_params
    params.permit(:page, :per_page).to_h
  end
end
