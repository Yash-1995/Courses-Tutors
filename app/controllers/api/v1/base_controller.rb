module Api
  module V1
    class BaseController < ::ApplicationController

      private

      def render_success_response(resource, serializer)
        render json: {
          "#{resource_key(resource).to_sym}": serialized_data(resource)
        }, status: :ok
      end

      def render_error_response(resource)
        messages = []
        if resource.errors.any?
          messages = resource.errors.full_messages
        else
          messages << "Validation failed or some error occured"
        end
        render json: {
          errors: messages
        }, status: 422
      end

      def listing_response(resources, serializer, key)
        render json: {"#{key.to_sym}": ActiveModel::Serializer::CollectionSerializer.new(resources, serializer: serializer)}
      end

      def resource_key(resource)
        resource.class.name.downcase
      end

      def serialized_data(resource)
        "#{resource.class.name}Serializer".constantize.new(resource)
      rescue
        resource.as_json
      end
    end
  end
end
