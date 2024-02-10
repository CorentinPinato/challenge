require 'swagger_helper'

RSpec.describe 'v1/meals', type: :request do

  path '/v1/meals' do
    parameter name: 'filter[category]', in: :query, type: :string, description: 'filter'

    get('Filter meals by category') do
      tags 'Meals'
      produces 'application/vnd.api+json'

      response 200, 'successful' do
        let('filter[category]') { "Beef" }

        schema type: :object,
        properties: {
          data: {
            type: :array,
            items: {
              '$ref' => '#/components/schemas/meal'
            }
          }
        }
        run_test!
      end
    end
  end

  path '/v1/meals/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('Retrieve a meal') do
      tags 'Meals'
      produces 'application/vnd.api+json'

      response(200, 'successful') do
        let(:id) { 52874 }
        schema type: :object,
        properties: {
          data: {
            '$ref' => '#/components/schemas/meal'
          }
        }
        run_test!
      end
    end

    get('Retrieve a meal') do
      tags 'Meals'
      produces 'application/vnd.api+json'

      response 404, 'failed' do
        let(:id) { 0 }

        schema type: :object,
        properties: {
          data: {
            '$ref' => '#/components/schemas/not_found_error'
          }
        }
        run_test!
      end
    end
  end
end
