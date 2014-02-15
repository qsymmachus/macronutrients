##Macronutrients search: improvements

###Team members
Matt Higgins, Roy Lee, Eli Shkurkin, Patrick Vilhena, John Olmsted

###MVP goal 2/14/14
1. Database caching of food nutrition models
2. Data visualization of nutritional information (DS3 or similar libraries)
3. Custom serving sizes
4. Single page app/asynchronous search

###Reach goals
1. Meal planning?
2. Search by nutrient!
3. Bootstrap

###To launch the app on localhost
1. Launch redis: 
$ redis-server /usr/local/etc/redis.conf

2. Launch sidekiq:
$ sidekiq -r./config/environment.rb

3. Launch shotgun:
$ shotgun