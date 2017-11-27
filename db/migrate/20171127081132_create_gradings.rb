class CreateGradings < ActiveRecord::Migration[5.1]
  def change
    create_table :gradings do |t|
      t.timestamps
    end
  end
end
