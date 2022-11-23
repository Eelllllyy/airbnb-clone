# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe Api::RegistrationsController do
  path '/api/registration' do
    post 'Зарегистрироваться' do
      tags 'Регистрация'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :registration, in: :body, schema: { '$ref': '#/components/schemas/registration' }

      response 201, 'Пользователь создан' do
        let(:registration) do
          {
            name: 'Test',
            email: 'test@test.test',
            password: 'test'
          }
        end

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)

          %i[csrf access access_expires_at refresh refresh_expires_at].each do |k|
            expect(body).to have_key(k)
          end
        end
      end

      response 422, 'Пользователь уже существует' do
        let(:user) { create(:user) }
        let(:registration) do
          {
            name: 'Test',
            email: user.email,
            password: 'test'
          }
        end

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)
          expect(body[:error]).to eq(I18n.t('api.registrations.errors.email_already_exists'))
        end
      end

      response 422, 'Ошибка при регистрации' do
        let(:registration) do
          {
            name: 'Test',
            password: 'test'
          }
        end

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)
          expect(body[:errors]).to be_present
          expect(body[:errors][:full_messages][0]).to eq("Email can't be blank")
        end
      end
    end
  end
end
