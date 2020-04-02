class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.integer :playlist_id
      t.string :url
    end
  end
end
