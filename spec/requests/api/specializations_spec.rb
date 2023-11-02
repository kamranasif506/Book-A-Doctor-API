require 'swagger_helper'

RSpec.describe 'api/specializations', type: :request do
  path '/api/v1/specializations' do
    get 'Retrieves all specializations' do
      tags 'Specializations'
      produces 'application/json'

      response '200', 'specializations found' do
        schema type: :array,
               items: { '$ref' => '#/components/schemas/specialization' }

        run_test!
      end
    end
  end
end
