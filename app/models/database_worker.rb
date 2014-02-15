class DatabaseWorker
  include Sidekiq::Worker

  def perform(food)
    NutritionGetter.add_to_database(food)
  end
end