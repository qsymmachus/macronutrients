class CreateFoodNutritions < ActiveRecord::Migration
  def change
    create_table :food_nutritions do |col|
      col.string :name
      col.float :calories
      col.float :fat
      col.float :carbs
      col.float :protein
      col.belongs_to :result

      col.timestamps
    end
  end
end
