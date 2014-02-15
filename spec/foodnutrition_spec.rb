require 'spec_helper'

describe "FoodNutrition, a model for the nutritional content of a food" do
  args = {name: "tears", calories: 10, fat: 1.0, carbs: 3.0, protein: 2.5}
  test_nutrition = FoodNutrition.new(args)

  it "should have have the instance variables name, calories, fat, carbs, and protein" do
    expect(test_nutrition.name).to eq "tears"
    expect(test_nutrition.calories).to eq 10
    expect(test_nutrition.fat).to eq 1.0
    expect(test_nutrition.carbs).to eq 3.0
    expect(test_nutrition.protein).to eq 2.5
  end
end