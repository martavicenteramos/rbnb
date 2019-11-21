class AddZipCodeToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :zip_code, :string
  end
end
