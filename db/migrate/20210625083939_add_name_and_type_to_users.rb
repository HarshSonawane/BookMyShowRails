class AddNameAndTypeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :integer
    add_column :users, :type, :integer, default: 0
  end
end
