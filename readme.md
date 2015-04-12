#Blockbuster App
* * *

You can see it live [here](https://myblockbuster.herokuapp.com).

##Usage

* Clone the repo
* bundle
* rake db:reset
* rails s

Specifications (run on CLI, everything green)

* spinach
* rspec

Test user credentials

* email: email@example.com
* password: password

##Some explanations
* * *

###Modeling

A film has many PurchaseOptions.

A PurchaseOption can belong to many movies, sharing the price and quality (many to many relationship). If it would be a one to many relationship "a PurchaseOption only belong to one movie" we would have a a lot of rows in PurchaseOption table.

Rails many to many relationships are modeled with a has_many :through association, creating a new model and database table MoviePurchase Option.

A Purchase has an user_id and a movie_purchase_option_id.

A PurchaseOption is like a kind of category, or it could belong to a category, like news, classical, top sells... not implemented, but that's why a PurchaseOption can belong to many movies. This way, if we want to change the price of a PurchaseOption, we change it for all the movies (useful if we want to change for example the western category). A PurchaseOption is going to have id, quality_type and price.

Let's ask ourselves some questions!

* What happens if we change a PurchaseOption price?
> We have all MoviePurchaseOptions with an invalid price!
> We need to save price in MoviePurchaseOption.

* What happens if we want to know the PurchaseOptions that a Movie has had the last year, price included? What happens if we want to cross check that data with the movie sells in that period?
> Seems to be important! We should care about it.

To make this possible, we have to save in MoviePurchaseOption table the attributes: id, movie_id, purchase_option_id, price and active (to know wich one of the purchase options of a movie is active). This way, when we modify the price of a PurchaseOption we will have to create a MoviePurchaseOption with active: true and set to false the actived MoviePurchaseOption.

![DB Modeling](https://s3-eu-west-1.amazonaws.com/myblockbuster/blockbuster_erd.png)

###Testing
* Rspec
* Capybara
* Selenium-webdriver (opens Firefox)
* Spinach
* FactoryGirl
* Faker

###AJAX
* Sig in and Sign up
> Returns json
* Movies
> Returns js
* Purchase
> Returns js

###Caching
* movies/index
* _movie.html.erb