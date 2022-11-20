# frozen_string_literal: true

FactoryBot.define do
  factory :stay do
    name { 'MyString' }
    location { 'MyString' }
    date_from { '21.11.2022' }
    date_to { '22.11.2022' }
    price { 'MyString' }

    association :host, factory: :user
  end
end
