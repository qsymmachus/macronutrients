get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/foods' do
  food = params[:food]
  results_number = params[:results_number].to_i
  @foods = NutritionGetter.first_x_results(food, results_number)
  @search_term = food
  if results_number == 5 && !NutritionGetter.food_in_local_database?(food)
    DatabaseWorker.perform_async(params[:food])
  end
  erb :index
end

error do
  'Server error - ' + env['sinatra.error'].name
end