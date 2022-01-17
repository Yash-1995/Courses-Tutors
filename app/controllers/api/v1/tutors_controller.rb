module Api
  module V1
    class TutorsController < BaseController

      def create
        tutor = Tutor.new(tutor_params)
        if tutor.save
          render_success_response(tutor, TutorSerializer, :created)
        else
          render_error_response(tutor)
        end
      end


      def update
        if tutor.update(tutor_params)
          render_success_response(tutor, TutorSerializer)
        else
          render_error_response(tutor)
        end
      end

      private

      def tutor
      	@tutor ||= Tutor.find(params[:id])
      end

      def tutor_params
        params.require(:tutor).permit(:name, :course_id)
      end
    end
  end
end