class AddContentAndVoiceToAssignments < ActiveRecord::Migration[5.1]
  def change
    add_column :assignments, :content, :string
    add_column :assignments, :voice, :string
  end
end
