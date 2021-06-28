class RemoveNoOfSeatsFromTheater < ActiveRecord::Migration[6.1]
  def change
    remove_column :theaters, :no_of_screens, :string
  end
end
