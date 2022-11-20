# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe Api::ExperiencesController do
  let(:user) { create(:user) }

  path '/api/experiences' do
    get 'Получить список впечатлений' do
      tags 'Впечатления'
      produces 'application/json'
      security [Bearer: {}]

      parameter(
        name: :search,
        in: :query,
        type: :string,
        required: false,
        description: 'Поиск по полям: name'
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

      response 200, 'Список впечатлений получен' do
        let(:Authorization) { token_for(user)[:access] }

        before { create(:experience) }

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)
          expect(body.size).to eq(1)
        end
      end
    end
  end
end
