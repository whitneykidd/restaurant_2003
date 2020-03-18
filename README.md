# Restaurant

## Setup Instructions (for Instructors)

* Clone this repo
* remove the turingschool remote
* remove the git history and initialize a new git repo
* commit the Iteration 1 tests, Iteration 2 tests, lib/restaurant.rb, and the `##Instructions` from the README, for students.
* create a branch called `spec`
* commit the Gemfile, spec directory, and, optionally, the remainder of the README
* Create a new repo on turingschool-examples called `restaurant_<cohort number>`
* Add that remote
* Push up both branches


### Spec Harness Instructions

In order to run the spec harness, first create a directory with a `students.txt` file.

In `students.txt`, put a list of your students Github handles.  For example:

```
aziobrow
dionew1
memcmahon
s-espinosa
```

From the command line, run the following script, replacing `<repository_name` with the name of the challenge repo:

```
for i in `cat students.txt`; do
  git clone git@github.com:$i/<repository_name> $i
  cd $i
  git pull origin spec # this will cause a merge commit message
  rspec
  echo
  echo
  read -p 'Press Enter to continue'
  cd ..
done
```

For each student, you will need to create or `:q` out of a merge commit message!

## Instructions

* Fork this Repository
* Clone your forked repo
* Complete the activity Below
* Push your solution to your repo
* Submit a Pull Request from your repo to this repo
    * Put your name in your PR!

## Iteration 1

For iteration 1, we have created all of the tests you will need - unskip tests one by one (remove or comment out the word `skip` at the top of each test), making each pass before moving on to the next test.  The tests will model the following interaction pattern:

```ruby
pry(main)> require './lib/restaurant'
#=> true

pry(main)> restaurant = Restaurant.new('10:00', 'Fuel Cafe')
#=> #<Restaurant:0x007fb9aac93b08 @dishes=[], @name="Fuel Cafe", @opening_time="11:30">

pry(main)> restaurant.opening_time
#=> "11:30"

pry(main)> restaurant.name
#=> "Fuel Cafe"

pry(main)> restaurant.dishes
#=> []
```

## Iteration 2

For iteration 2, we have created all of the tests you will need - unskip tests one by one, making each pass before moving on the the next test.  The tests will model the interaction pattern below.  The `closing_time` method should add the number of hours sent in the argument to the `opening_time` and return the time in 24 hour format.  For example, 3:00 PM (12hour / clock time) is 15:00 (24hour). A restaurant will only ever open at the top of the hour (:00).

```ruby  
pry(main)> require './lib/restaurant'
#=> true

pry(main)> restaurant1 = Restaurant.new('10:00', 'Fuel Cafe')
#=> #<Restaurant:0x007fdddb9ba490 @dishes=[], @name="Fuel Cafe", @opening_time="10:00">

pry(main)> restaurant2 = Restaurant.new('16:00', 'Il Poggio')
#=> #<Restaurant:0x007fdddb900018 @dishes=[], @name="Il Poggio", @opening_time="16:00">

pry(main)> restaurant1.closing_time(8)
#=> "18:00"

pry(main)> restaurant2.closing_time(7)
#=> "23:00"

pry(main)> restaurant2.add_dish('Burrata')

pry(main)> restaurant2.add_dish('Pizzetta')

pry(main)> restaurant2.add_dish('Ravioli')

pry(main)> restaurant2.dishes
#=> ["Burrata", "Pizzetta", "Ravioli"]
```

## Iteration 3

Now, it is time for you to write your own tests!  Follow the interaction pattern below to write one test, make that test pass, and move on to the next test.  You will have at minimum, one test per new method. A restaurant is open for lunch, if its opening time is before 12:00.  All restaurants are **VERY** excited about their dishes - The method `menu_dish_names` will return a list of dish names, **IN ALL CAPS** ('Breakfast Burrito' should become 'BREAKFAST BURRITO').

```ruby
require './lib/restaurant'
#=> true

restaurant1 = Restaurant.new('10:00', 'Fuel Cafe')
#=> #<Restaurant:0x007ff6eb3e5b18 @dishes=[], @name="Fuel Cafe", @opening_time="10:00">

restaurant2 = Restaurant.new('16:00', 'Il Posto')
#=> #<Restaurant:0x007ff6eb40eec8 @dishes=[], @name="Il Posto", @opening_time="16:00">

restaurant1.open_for_lunch?
#=> true

restaurant2.open_for_lunch?
#=> false

restaurant2.add_dish('Burrata')

restaurant2.add_dish('Pizzetta')

restaurant2.add_dish('Ravioli')

restaurant2.menu_dish_names
#=> ["BURRATA", "PIZZETTA", "RAVIOLI"]
```

## Iteration 4

Continue writing tests to satisfy the following interaction pattern. The method `announce_closing_time` will change the format of the end time to a 12 hour format (for example, 15:00 would be converted to 3:00) and return a string to announce the restaurant's closing time.

```ruby
pry(main)> require './lib/restaurant'
#=> true

pry(main)> restaurant1 = Restaurant.new('6:00', 'Fuel Cafe')
#=> #<Restaurant:0x007f94e4bfad80 @dishes=[], @name="Fuel Cafe", @opening_time="6:00">

pry(main)> restaurant2 = Restaurant.new('16:00', 'Il Posto')
#=> #<Restaurant:0x007f94e53ef658 @dishes=[], @name="Il Posto", @opening_time="16:00">

pry(main)> restaurant1.announce_closing_time(5)
#=> "Fuel Cafe will be closing at 11:00AM"

pry(main)> restaurant2.announce_closing_time(7)
#=> "Il Posto will be closing at 11:00PM"
```
