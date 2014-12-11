class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :url
      t.boolean :done
      t.string :winner
      t.string :total_time
      t.timestamps
    end
  end
end
