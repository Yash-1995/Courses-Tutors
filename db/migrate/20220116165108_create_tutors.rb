class CreateTutors < ActiveRecord::Migration[6.0]
  def change
    create_table :tutors do |t|
      t.string :name
      t.bigint :course_id

      t.timestamps
    end
  end
end
