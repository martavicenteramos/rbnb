class AddCityToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :city, :string
  end
end
