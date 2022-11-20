# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe Api::StaysController do
  let(:user) { create(:user) }

  path '/api/stays' do
    get 'Получить список мест' do
      tags 'Места'
      produces 'application/json'
      security [Bearer: {}]

      parameter(
        name: :search,
        in: :query,
        type: :string,
        required: false,
        description: 'Поиск по полю name'
      )

      parameter(
        name: :page,
        in: :query,
        required: false,
        description: 'Номер нужной страници'
      )

      parameter(
        name: :items,
        in: :query,
        required: false,
        description: 'Кол-во элементов отображаемых на странице'
      )

      response 200, 'Список мест получен' do
        let(:Authorization) { token_for(user)[:access] }

        before { create(:stay) }

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)
          expect(body.size).to eq(1)
        end
      end
    end
  end

  path '/api/stays/{id}' do
    let(:stay) { create(:stay) }
    let(:id) { stay.id }

    parameter name: :id,
              in: :path,
              type: :string,
              required: true,
              description: 'ID места'

    get 'Получить место' do
      tags 'Места'
      produces 'application/json'
      security [Bearer: {}]

      response 200, 'Место получено' do
        let(:Authorization) { token_for(user)[:access] }

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)
          expect(body[:id]).to eq(stay.id)
        end
      end

      response 404, 'Место не найден' do
        let(:Authorization) { token_for(user)[:access] }
        let(:id) { 0 }

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)
          expect(body[:error]).to eq(I18n.t('api.stays.errors.not_found'))
        end
      end
    end
  end
end
