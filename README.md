# Flower Shop
A flower shop used to base the price of their flowers on an item by item cost. So if a customer ordered 10 roses then they would be charged 10x the cost of single rose. The flower shop has decided to start selling their flowers in bundles and charging the customer on a per bundle basis. So if the shop sold roses in bundles of 5 and 10 and a customer ordered 15 they would get a bundle of 10 and a bundle of 5.

## Environment
To get the application up and running, you need to follow these steps:

#### Install Ruby
You can use several tools to install ruby. This [page](https://www.ruby-lang.org/en/documentation/installation/) describes how to use major package management systems and third-party tools for managing and installing Ruby and how to build Ruby from source. The application was devloped and tested for ruby version 2.4.0.

#### Install RubyGem
RubyGems is a package management framework for Ruby. This [page](https://rubygems.org/pages/download) describes how to install rubygems.

#### Install bundler
Bundler provides a consistent environment for Ruby projects by tracking and installing the exact gems and versions that are needed. To install bundler, use this command

    gem install bundler

## Installation instructions
Install the required gems by running the following command:

    bundle install

## Testing instructions
RSpec is used for testing. Run the following command to test the application

    bundle exec rspec --format doc

Make sure all test are green before using the application. This application has 100% test coverage constraint.

## Code quality

    bundle exec rake quality:rubocop

## Usage instructions
The application needs two arguments: the first is a json file for products, the second is a text file for an order.
To run the application, please run the following command

    ruby run.rb data/products.json data/order.txt

The output will be:

    10 R12 $12.99
      1 X 10 $12.99
    15 L09 $41.9
      1 X 9 $24.95
      1 X 6 $16.95
    13 T58 $25.85
      2 X 5 $9.95
        1 X 3 $5.95

# Input files

The application requires a json file for the products with the following format

    [
      {
        "name" : "Roses",
        "code" : "R12",
        "bundles": [
          { "quantity": 5, "price": 6.99 },
          { "quantity": 10, "price": 12.99}
        ]
      },
      {
        "name" : "Lilies",
        "code" : "L09",
        "bundles": [
          { "quantity": 3, "price": 9.95 },
          { "quantity": 6, "price": 16.95 },
          { "quantity": 9, "price": 24.95 }
        ]
      },
      {
        "name" : "Tulips",
        "code" : "T58",
        "bundles": [
          { "quantity": 3, "price": 5.95 },
          { "quantity": 5, "price": 9.95 },
          { "quantity": 9, "price": 16.99 }
        ]
      }
    ]


The order text file should have the following format

    10 R12
    15 L09
    13 T58
