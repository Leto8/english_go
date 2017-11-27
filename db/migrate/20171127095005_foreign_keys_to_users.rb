class ForeignKeysToUsers < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :lessons, :users, column: :student_id
    add_foreign_key :lessons, :users, column: :teacher_id
  end
end
