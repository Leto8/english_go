class AddForeignKeysToLessons < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :lessons, :assignments
    add_foreign_key :lessons, :submissions
    add_foreign_key :lessons, :gradings
  end
end
