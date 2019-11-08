# Spotlight

## Your one-stop shop to manage your online reputation

*Spotlight* is a platform with the goal of making the lives of venue owners easier, by collating and displaying, in one convenient place, all the reviews that their customers have left anywhere online.

## Specifications

Built on Ruby on Rails `v5.2.0` and Ruby `v2.6.0`

## Contribution

The main contributors to this project are:

- [Jeroen Rutten](https://github.com/loftlights)
- [Josh Unwin](https://github.com/josh-unwin)
- [Luka Salevic](https://github.com/Sensanaty)
- [Andrea Bortolameazzi](https://github.com/andreapmd)

To contribute yourself, create a fork of this repo and clone it, then run

```shell
bundle install
yarn install
rails db:drop db:create db:migrate db:seed
```

After the migrations and seeds are finished, to view the project run `rails s`. The local development server defaults to `localhost:3000`.

Create a feature branch in your fork, create a pull request and wait for the request to be reviewed.
