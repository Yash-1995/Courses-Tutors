require 'rails_helper'

RSpec.describe "Tutors", type: :request do

  describe "POST /create" do
      let!(:course){Course.create name: "Course1", description: "Description for Course1"}
    context "Creating Tutors" do
      it "Should create Tutor Successfully with course" do
        post "/api/v1/tutors", params: {tutor: {name: "Yash", course_id: course.id}}
        expect(response.content_type).to include("application/json")
        expect(response).to have_http_status(:created)
      end

      it "Should create Tutor Successfully without course" do
        post "/api/v1/tutors", params: {tutor: {name: "Yash", course_id: nil}}
        expect(response.content_type).to include("application/json")
        expect(response).to have_http_status(:created)
      end

      it "Should not create Tutor without name" do
        post "/api/v1/tutors", params: {tutor: {name: nil , course_id: nil}}
        expect(response.content_type).to include("application/json")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
