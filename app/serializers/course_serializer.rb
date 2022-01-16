class CourseSerializer < BaseSerializer
	attributes :id, :name, :description
	has_many :tutors, serializer: TutorSerializer
end