class CreateResults < ActiveRecord::Migration[8.0]
  def change
    create_table :results do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :total_count
      t.integer :total_atari
      t.float :rate

      t.timestamps
    end
  end
end
