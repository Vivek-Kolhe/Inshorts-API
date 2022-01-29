## Inshorts API
A simple Inshorts API written in Ruby and Sinatra. This was just made for fun and for familiarizing myself with Ruby.

## Usage
API is available at `https://api-inshorts.herokuapp.com/`.

  - News from all categories.\
    `https://api-inshorts.herokuapp.com/all`
    
  - News from specific category.\
    `https://api-inshorts.herokuapp.com/news?category={category}`
    
    **Example:**\
    `https://api-inshorts.herokuapp.com/news?category=sports`\
    `https://api-inshorts.herokuapp.com/news?category=startup`
    
## Available Categories
  - national
  - business
  - sports
  - world
  - politics
  - technology
  - startup
  - entertainment
  - miscellaneous
  - hatke
  - science
  - automobile

## Set up
  - Install everything using\
    `bundle install`
  - Run server using\
    `bundle exec rackup config.ru -p {PORT_NUMBER}`
