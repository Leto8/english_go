class ChangeAssVoiceAndAddKeywords < ActiveRecord::Migration[5.1]
  def change
    add_column :assignments, :keywords, :string
    remove_column :assignments, :voice, :string
    add_column :assignments, :title, :string
  end
end
