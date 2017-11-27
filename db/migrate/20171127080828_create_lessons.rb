class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.references :assignment
      t.references :submission
      t.references :grading
      t.timestamps
    end
  end
end
