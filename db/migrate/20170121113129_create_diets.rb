class CreateDiets < ActiveRecord::Migration[5.0]
  def change
    create_table :diets do |t|
      t.integer :client_id
      t.integer :effort
      t.integer :kcal
      t.integer :protein
      t.integer :carbohydrates
      t.integer :fat
      t.integer :client_height
      t.integer :client_weight
      t.integer :goal
      t.text :description

      t.timestamps
    end
  end
end
