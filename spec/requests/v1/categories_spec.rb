require 'swagger_helper'

RSpec.describe 'v1/categories', type: :request do

  path '/v1/categories' do

    get('Lists categories') do
      tags 'Posts'
      produces 'application/vnd.api+json'

      response 200, 'successful' do
        schema type: :object,
        properties: {
          data: {
            type: :array,
            items: {
              '$ref' => '#/components/schemas/category'
            }
          }
        }
        run_test!
      end
    end
  end
end
