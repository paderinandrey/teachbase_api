FactoryGirl.define do
  factory :course do
    sequence(:course_id)  {|n| n }
    sequence(:name)       {|n| "Name #{n}" }
  end
end
