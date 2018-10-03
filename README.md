# Welcome to Recipe Sinatra Project

## Overviews
  User could create an account and login. If user not logged in could not see recipes or created or edit. If user logged in cannot edit other users recipe or delete. User could edit or delete just their recipes.

### Start the project

* ```git clone https://github.com/rahymov/sinatra-recipe ```

* ``` rake db:migrate ```

* start local server ``` shotgun ```

### File Structure
```
├── app
│   ├── controllers
│   │   ├── application_controller.rb
│   │   ├── categories_controller.rb
│   │   ├── recipes_controller.rb
│   │   └── users_controller.rb
│   ├── models
│   │   ├── category.rb
│   │   ├── recip_category.rb
│   │   ├── recipe.rb
│   │   ├── user.rb
│   │   
│   └── views
│       ├── categories
│       │   ├── category.erb
│       │   
│       ├── recipes
│       │   ├── edit.erb
│       │   ├── index.erb
│       │   ├── new.erb
│       │   └── results.erb
│       │   └── show.erb
│       ├
│       ├── users
│       ├    ├── create_user.erb
│       ├    ├── login.erb
│       ├    ├── show.erb
│       |    
│       ├── footer.erb
│       ├── header.erb
│       ├── home.erb
│       ├── layout.erb
├── config
|      ├── environment.rb
├── db
│     ├── migrate
│           ├── 20180925163632_create_users.rb
│           ├── 20180927171039_create_recipes.rb
│           ├── 20180929030513_create_categories.rb
│           ├── 20180929031801_create_recipe_categories.rb
│           ├── 20180929034257_add_missing_timestamps.rb
│
│── public
│    ├── application.css
│── config.ru
│── Gemfile    
│── Gelfile.lock
│── LICENSE.txt
│── Rakefile
│── Rakefile
│── README.md     
```
