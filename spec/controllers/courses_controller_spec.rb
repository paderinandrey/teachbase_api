require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  describe 'GET #index' do
    let!(:courses) { create_list(:course, 3) }
    let(:course) { courses.first }

    before { get :index, params: { page: 1, per_page: 1, format: :json } }

    it 'returns list of courses' do
      expect(response.body).to have_json_size(1)
    end

    %w(id name description owner_name).each do |attr|
      it "Course object contains #{attr}" do
        expect(response.body).to have_json_path("0/#{attr}")
      end
    end
  end
end
