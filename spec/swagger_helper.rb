# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.openapi_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under openapi_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a openapi_spec tag to the
  # the root example_group in your specs, e.g. describe '...', openapi_spec: 'v2/swagger.json'
  config.openapi_specs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      paths: {},
      servers: [
        {
          url: '{defaultHost}',
          variables: {
            defaultHost: {
              default: ENV.fetch('BASE_URL')
            }
          }
        }
      ],
      components: {
        schemas: {
          category: {
            type: :object,
            properties: {
              type: { type: :string, example: "category" },
              id: { type: :string, example: "1" },
              attributes: {
                type: :object,
                properties: {
                  name: { type: :string, example: "Beef" },
                  thumb_url: { type: :string, example: "https://www.themealdb.com/images/category/beef.png" },
                  description: { type: :string, example: "Beef is the culinary name for meat from cattle..."}
                }
              }
            }
          },
          meal: {
            type: :object,
            properties: {
              type: { type: :string, example: "meal" },
              id: { type: :string, example: "52874" },
              attributes: {
                type: :object,
                properties: {
                  name: { type: :string, example: "Beef and Mustard Pie"},
                  drink_alternate: { type: :string, nullable: true },
                  category: { type: :string, example: "Beef" },
                  area: { type: :string, example: "British" },
                  instructions: { type: :string, example: "Preheat the oven to 150C/300F/Gas 2..." },
                  thumb_url: { type: :string, example: "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg" },
                  tags: {
                    type: :array,
                    items: { type: :string, example: "Meat" }
                  },
                  youtube_url: { type: :string, example: "https://www.youtube.com/watch?v=nMyBC9staMU" },
                  ingredients: {
                    type: :array,
                    items: {
                      type: :object,
                      properties: {
                        name: { type: :string, example: "Beef" },
                        measure: { type: :string, example: "1kg" }
                      }
                    } 
                  }
                }
              },
              links: {
                type: :object,
                properties: { 
                  self: { type: :string, example: "http://localhost:3000/v1/meals/52874" }
                }
              }
            }
          },
          not_found_error: {
            type: :object,
            properties: {
              error: {
                type: :object,
                properties: {
                  status: { type: :integer, example: 404 },
                  title: { type: :string, example: "Not Found." },
                  detail: { type: :string, example: "Meal not found." }
                }
              }
            }
          }
        }
      }
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The openapi_specs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.openapi_format = :yaml
end
