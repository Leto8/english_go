class AddUsersToLessons < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :student_id, :bigint
    add_column :lessons, :teacher_id, :bigint
  end
end
