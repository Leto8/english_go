class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.references :assignments
      t.references :submissions
      t.references :gradings
      t.timestamps
    end
  end
end
