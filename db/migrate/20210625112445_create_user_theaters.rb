class CreateUserTheaters < ActiveRecord::Migration[6.1]
  def change
    create_table :user_theaters do |t|
      t.references :user, null: false, foreign_key: true
      t.references :theater, null: false, foreign_key: true

      t.timestamps
    end
  end
end
