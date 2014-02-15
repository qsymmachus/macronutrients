require 'spec_helper'

describe "NutritionGetter, an abstract class for retrieving nutrition data" do
  it "should complete a food nutrition search and build a FoodNutrition object" do
    apple_nutrition = NutritionGetter.first_result("apples")
    expect(apple_nutrition.class).to eq FoodNutrition
  end

  it "should complete a food nutrition search for the first x results" do
    apples_array = NutritionGetter.first_x_results("apples", 5)
    expect(apples_array.length).to eq 5
    expect(apples_array.first.class).to eq FoodNutrition
  end

  it "should return false if a food does not exist" do
    expect(NutritionGetter.food_exists?("asdfasdf")).to eq false
  end

  it "should parse a nutrition description into a hash of macros" do
    apples_description = "Per 100g - Calories: 52kcal | Fat: 0.17g | Carbs: 13.81g | Protein: 0.26g"
    macros = NutritionGetter.parse_description(apples_description)
    expect(macros[:calories]).to eq 52
    expect(macros[:fat]).to eq 0.2
    expect(macros[:carbs]).to eq 13.8
    expect(macros[:protein]).to eq 0.3
  end

  it "should return false if a food is not in the database" do
    expect(NutritionGetter.food_in_local_database?("awergih")).to eq false
  end

  it "should return true if a food is in the database" do
    test_result = Result.create(search_term: "crepes")
    expect(NutritionGetter.food_in_local_database?("crepes")).to eq true
    test_result.destroy
  end

  it "should add food to the database" do
    NutritionGetter.add_to_database("pears")
    test_pear = Result.find_by_search_term("pears")
    expect(test_pear).to_not eq nil
    expect(test_pear.food_nutritions).to_not eq []
  end
end