# Seeds database with results for top fifty search terms for fast API-free
# retrieval of most the popular results.

TOP_FIFTY_FOODS = ["banana", "apple", "sweet potato", "avocado", "grapes", "chicken", "strawberries", "blueberries", "celery", "broccoli", "spinach", "tomatoes", "carrots", "potato", "almonds", "lettuce", "brown rice", "rice", "cucumber", "onion", "cheddar cheese", "walnuts", "pineapple", "quinoa", "kiwi", "olive oil", "salmon", "grapefruit", "blackberries", "flaxseed", "mushroom", "honey", "shrimp", "cantaloupe", "coffee", "orange", "milk", "butternut squash", "chickpeas", "pork", "beef"]

TOP_FIFTY_FOODS.each do |search_term|
  sleep(60)
  NutritionGetter.add_to_database(search_term)
end