require 'swagger_helper'

RSpec.describe 'api/doctors', type: :request do
  path '/api/v1/doctors' do
    get 'Retrieves all doctors' do
      tags 'Doctors'
      produces 'application/json'

      response '200', 'doctors found' do
        schema type: :array,
               items: { '$ref' => '#/components/schemas/doctor' }

        run_test!
      end
    end
  end

  path '/api/v1/doctors/{id}' do
    get 'Retrieves a doctor' do
      tags 'Doctors'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'doctor found' do
        schema '$ref' => '#/components/schemas/doctor'

        let(:id) { Doctor.create(doc_name: 'foo').id }
        run_test!
      end

      response '404', 'doctor not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/api/v1/doctors' do
    post 'Creates a doctor' do
      tags 'Doctors'
      consumes 'application/json'
      parameter name: :doctor, in: :body, schema: {
        type: :object,
        properties: {
          doc_name: { type: :string },
          profile_picture: { type: :string },
          bio: { type: :string },
          time_available_from: { type: :string },
          time_available_to: { type: :string },
          specialization_id: { type: :integer }
        },
        required: %w[doc_name profile_picture bio time_available_from time_available_to
                     specialization_id]
      }

      response '201', 'doctor created' do
        let(:doctor) do
          { doc_name: 'foo', profile_picture: 'bar', bio: 'baz', time_available_from: 'qux', time_available_to: 'quux',
            specialization_id: 'corge' }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:doctor) { { doc_name: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/doctors/{id}' do
    put 'Updates a doctor' do
      tags 'Doctors'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :doctor, in: :body, schema: {
        type: :object,
        properties: {
          doc_name: { type: :string },
          profile_picture: { type: :string },
          bio: { type: :string },
          time_available_from: { type: :string },
          time_available_to: { type: :string },
        },
        required: %w[doc_name profile_picture bio time_available_from time_available_to
                     specialization_id]
      }

      response '200', 'doctor updated' do
        let(:id) { Doctor.create(doc_name: 'foo').id }
        let(:doctor) do
          { doc_name: 'foo', profile_picture: 'bar', bio: 'baz', time_available_from: 'qux', time_available_to: 'quux',
            specialization_id: 'corge' }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:id) { Doctor.create(doc_name: 'foo').id }
        let(:doctor) { { doc_name: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/doctors/{id}' do
    delete 'Deletes a doctor' do
      tags 'Doctors'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'doctor deleted' do
        let(:id) { Doctor.create(doc_name: 'foo').id }
        run_test!
      end

      response '404', 'doctor not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
