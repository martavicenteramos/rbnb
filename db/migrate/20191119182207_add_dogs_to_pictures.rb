class AddDogsToPictures < ActiveRecord::Migration[5.2]
  def change
    add_reference :pictures, :dog, foreign_key: true

  end
end
