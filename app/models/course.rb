class Course < ApplicationRecord
  validates :name, :course_id, presence: true
end
