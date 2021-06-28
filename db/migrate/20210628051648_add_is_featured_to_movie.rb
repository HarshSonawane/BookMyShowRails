class AddIsFeaturedToMovie < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :is_featured, :boolean, default: false
  end
end
