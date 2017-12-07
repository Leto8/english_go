class ChangeAssVoiceAndAddKeywords < ActiveRecord::Migration[5.1]
  def change
    remove_column :assignments, :voice, :string
    add_column :assignments, :keywords, :string
    add_column :assignments, :title, :string
  end
end
