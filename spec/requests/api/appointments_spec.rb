require 'swagger_helper'

RSpec.describe 'api/appointments', type: :request do
  path '/api/v1/appointments' do
    get 'Retrieves all appointments' do
      tags 'Appointments'
      produces 'application/json', 'application/xml'

      response '200', 'Appointments found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 date: { type: :date },
                 time: { type: :time },
                 duration: { type: :integer },
                 doctor_id: { type: :integer },
                 user_id: { type: :integer }
               },
               required: %w[id date time duration doctor_id user_id]

        let(:id) do
          Appointment.create(date: '2021-05-20', time: '10:00', duration: 30, doctor_id: 1, user_id: 1).id
        end
        run_test!
      end

      response '404', 'Appointments not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/api/v1/appointments/{id}' do
    get 'Retrieves a appointment' do
      tags 'Appointments'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'Appointment found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 date: { type: :date },
                 time: { type: :time },
                 duration: { type: :integer },
                 doctor_id: { type: :integer },
                 user_id: { type: :integer }
               },
               required: %w[id date time duration doctor_id user_id]
      end
    end

    let(:id) do
      Appointment.create(date: '2021-05-20', time: '10:00', duration: 30, doctor_id: 1, user_id: 1).id
    end
    run_test!
  end

  response '404', 'Appointment not found' do
    let(:id) { 'invalid' }
    run_test!
  end
end

path '/api/v1/appointments' do
  post 'Creates a appointment' do
    tags 'Appointments'
    consumes 'application/json', 'application/xml'
    parameter name: :appointment, in: :body, schema: {
      type: :object,
      properties: {
        date: { type: :date },
        time: { type: :time },
        duration: { type: :integer },
        doctor_id: { type: :integer },
        user_id: { type: :integer }
      },
      required: %w[date time duration doctor_id user_id]
    }


    response '201', 'appointment created' do
      let(:appointment) { { date: '2021-05-20', time: '10:00', duration: 30, doctor_id: 1, user_id: 1 } }
      run_test!
    end

    response '422', 'invalid request' do
      let(:appointment) { { date: '2021-05-20', time: '10:00', duration: 30, doctor_id: 1, user_id: 1 } }
      run_test!
    end
  end
end

path '/api/v1/appointments/{id}' do
  gets 'Retrieves a appointment' do
    tags 'Appointments'
    produces 'application/json', 'application/xml'
    parameter name: :id, in: :path, type: :string

    response '200', 'Appointment found' do
      schema type: :object,
             properties: {
               id: { type: :integer },
               date: { type: :date },
               time: { type: :time },
               duration: { type: :integer },
               doctor_id: { type: :integer },
               user_id: { type: :integer }
             },
             required: %w[id date time duration doctor_id user_id]
    end

    let(:id) do
      Appointment.create(date: '2021-05-20', time: '10:00', duration: 30, doctor_id: 1, user_id: 1).id
    end
    run_test!
  end

  response '404', 'Appointment not found' do
    let(:id) { 'invalid' }
    run_test!
  end
end
