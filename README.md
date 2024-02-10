# README

## Ruby and Rails versions
This app uses Ruby `3.0.0` and Rails `7.1.3`.

## Getting started
Install dependencies:
```bash
bundle install
```

## Run the app
Run the app:
```bash
rails s
```

The server is will be running on [http://localhost:3000](http://localhost:3000)

## Endpoints
- [http://localhost:3000/v1/categories](http://localhost:3000/v1/categories)
- [http://localhost:3000/v1/meals?filter[category]=Beef](http://localhost:3000/v1/meals?filter[category]=Beef)
- [http://localhost:3000/v1/meals/52952](http://localhost:3000/v1/meals/52952)

## Database
No database was added in this project as it was not needed.

## Test

Integrations tests have been added using [rswag](https://github.com/rswag/rswag) with rspec.
```bash
rspec spec
```

Navigate to [http://localhost:3000/api-docs/index.html](http://localhost:3000/api-docs/index.html) to see and interact with the API docs.
