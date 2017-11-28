class AddContentAndVoicesToGrading < ActiveRecord::Migration[5.1]
  def change
    add_column :gradings, :content, :string
    add_column :gradings, :voice, :string
  end
end
