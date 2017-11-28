class AddContentAndVoiceToSubmissions < ActiveRecord::Migration[5.1]
  def change
    add_column :submissions, :content, :string
    add_column :submissions, :voice, :string
  end
end
