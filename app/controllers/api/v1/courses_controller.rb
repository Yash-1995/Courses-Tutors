module Api
  module V1
    class CoursesController < BaseController

      def index
        courses = Course.includes(:tutors)
        listing_response(courses, CourseSerializer, "courses")
      end

      def create
        course = Course.new(course_params)
        if course.save
          render_success_response(course, CourseSerializer, :created)
        else
          render_error_response(course)
        end
      end

      private

      def course_params
        params.require(:course).permit(:name, :description)
      end
    end
  end
end