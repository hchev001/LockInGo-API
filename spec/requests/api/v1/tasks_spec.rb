require 'swagger_helper'

RSpec.describe 'API::V1::Tasks', type: :request do

  path '/api/v1/tasks' do
    get 'Retrieves all tasks for the current user' do
      tags 'Tasks'
      produces 'application/json'
      security [bearer_auth: []]

      response '200', 'tasks found' do
        let(:Authorization) { "Bearer #{JsonWebToken.encode(user_id: create(:user).id)}" }
        run_test!
      end

      response '401', 'unauthorized' do
        run_test!
      end
    end

    post 'Creates a new task for the current user' do
      tags 'Tasks'
      consumes 'application/json'
      produces 'application/json'
      security [bearer_auth: []]
      parameter name: :task, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          description: { type: :string },
          color: { type: :string },
          icon: { type: :string },
          due_at: { type: :string, format: 'date-time' },
          is_active: { type: :boolean }
        },
        required: ['title']
      }

      response '201', 'task created' do
        let(:Authorization) { "Bearer #{JsonWebToken.encode(user_id: create(:user).id)}" }
        let(:task) { { title: 'Test Task', description: 'This is a test task', color: '#ff0000', icon: 'test-icon', due_at: Time.now + 1.day, is_active: true } }
        run_test!
      end

      response '401', 'unauthorized' do
        let(:task) { { title: 'Test Task' } }
        run_test!
      end

      response '422', 'unprocessable entity' do
        let(:Authorization) { "Bearer #{JsonWebToken.encode(user_id: create(:user).id)}" }
        let(:task) { { description: 'Missing title' } }
        run_test!
      end
    end
  end
end