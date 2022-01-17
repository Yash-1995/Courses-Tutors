require 'rails_helper'

RSpec.describe "Courses", type: :request do

  describe "POST /create" do
    context "Creating Courses" do
      it "Creates Course Successfully" do
        post "/api/v1/courses", params: {course: {name: "Course1", description: "Description"}}
        expect(response.content_type).to include("application/json")
        expect(response).to have_http_status(:created)
      end

      it "Will not create Course without course name" do
        post "/api/v1/courses", params: {course: {name: "", description: "Description"}}
        expect(response.content_type).to include("application/json")
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "Will not create two courses with identical name" do
        post "/api/v1/courses", params: {course: {name: "Course1", description: "Description"}}
        post "/api/v1/courses", params: {course: {name: "Course1", description: "Description"}}
        expect(response.content_type).to include("application/json")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "GET /index" do
    context "Listing of Courses along with tutors" do
      before do 
        (0..50).each do |number|
          Course.create(name: "Course#{number}", description: "Description for Course#{number}")
        end
      end
      it "Provides data for all Courses with their Tutors" do
        get "/api/v1/courses"
        expect(response.content_type).to include("application/json")
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
