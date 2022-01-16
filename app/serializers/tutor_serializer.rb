class TutorSerializer < BaseSerializer
	attributes :id, :name
	has_one :course, serializer: CourseSerializer
end