class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.text :description
      t.string :size
      t.integer :age
      t.string :breed
      t.string :gender
      t.string :location

      t.timestamps
    end
  end
end
