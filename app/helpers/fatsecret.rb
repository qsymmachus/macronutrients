# Class for retrieving and parsing nutrition data using the FatSecret API
class NutritionGetter
  def self.first_result(food)
    result = FatSecret.search_food(food)["foods"]["food"].first
    self.buildFoodNutrition(result)
  end

  def self.first_x_results(food, number_of_results)
    if self.food_in_local_database?(food)
      self.get_results_from_database(food, number_of_results)
    else
      results = []
      if self.food_exists?(food)
        number_of_results.times do |index|
          result = FatSecret.search_food(food)["foods"]["food"][index]
          results << self.buildFoodNutrition(result)
        end
      end
      results
    end
  end

  def self.food_exists?(food)
    result = FatSecret.search_food(food)
    result["foods"]["food"] ? true : false
  end

  def self.food_in_local_database?(food)
    Result.find_by_search_term(food) != nil
  end

  def self.get_results_from_database(food, number_of_results)
    Result.find_by_search_term(food).food_nutritions.limit(number_of_results).to_a
  end

  def self.add_to_database(food)
    if self.food_exists?(food)
      new_result = Result.new(search_term: food)
      food_nutritions = NutritionGetter.first_x_results(food, 5)
      food_nutritions.each do |food_nutrition|
        food_nutrition.save
        new_result.food_nutritions << food_nutrition
      end
      new_result.save
    end
  end

  def self.buildFoodNutrition(search_result)
    macros = self.parse_description(search_result["food_description"])
    food_nutrition = FoodNutrition.new({
        name: search_result["food_name"],
        calories: macros[:calories],
        fat: macros[:fat],
        carbs: macros[:carbs],
        protein: macros[:protein]
      })
    food_nutrition
  end

  def self.parse_description(description)
    macros = {}
    macros[:calories] = self.getCals(description)
    macros[:fat] = self.getFat(description)
    macros[:carbs] = self.getCarbs(description)
    macros[:protein] = self.getProtein(description)
    macros
  end

  def self.getCals(description)
    match = description.match(/Calories: (\d+)kcal/)
    match[1].to_i
  end

  def self.getFat(description)
    match = description.match(/Fat: (\d+.\d+)g/)
    match[1].to_f.round(1)
  end

  def self.getCarbs(description)
    match = description.match(/Carbs: (\d+.\d+)g/)
    match[1].to_f.round(1)
  end

   def self.getProtein(description)
    match = description.match(/Protein: (\d+.\d+)g/)
    match[1].to_f.round(1)
  end
end