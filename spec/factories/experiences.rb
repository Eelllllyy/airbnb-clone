# frozen_string_literal: true

FactoryBot.define do
  factory :experience do
    name { 'MyString' }
    rating { 1 }
    price { 'MyString' }
    association :host, factory: :user
  end
end
