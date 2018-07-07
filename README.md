# Creek Conditions

Return the weather if it's a good day for tubing the Boulder Creek.

Deployed to Heroku: [https://immense-cliffs-20214.herokuapp.com/](https://immense-cliffs-20214.herokuapp.com/)

## Setup

* Install Ruby 2.5.1

* Run:

  ```bash
  bundle install
  rails db:create && rails db:migrate
  rails server
  ```

## Running Tests

You can run our small suite of tests with

```bash
rails test
```

Currently we don't have VCR or another library to help with API requests, but in the future, this can easily be added.

## Things to do with more time.

* Better visuals, maybe a nice icon for each type of weather, i.e sunny icon for sunny weather.
* VCR for API tests
* Return a reason for why it's not a good day perhaps(i.e bad temp, bad flow rate, etc)
* Better test cases for the API request
* Better handling for if the API endpoint is slow/down
* Consider naming the Report/BoulderTubing methods differently
