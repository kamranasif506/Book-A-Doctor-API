require 'swagger_helper'

RSpec.describe 'api/current_user', type: :request do
  path '/api/v1/current_user' do
    get 'Retrieves current user' do
      tags 'Current User'
      produces 'application/json', 'application/xml'
      response '200', 'User found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 email: { type: :string },
                 jti: { type: :string }
               },
               required: %w[id email jti]
        run_test!
      end
    end
  end
end
