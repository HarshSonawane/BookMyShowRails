class CreateShows < ActiveRecord::Migration[6.1]
  def change
    create_table :shows do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :screen, null: false, foreign_key: true
      t.date :date
      t.time :time
      t.integer :amount

      t.timestamps
    end
  end
end
