class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.date :release_date
      t.integer :runtime, default: 120
      t.text :description

      t.timestamps
    end
  end
end
