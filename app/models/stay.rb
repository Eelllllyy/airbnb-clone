# frozen_string_literal: true

class Stay < ApplicationRecord
  belongs_to :host, class_name: 'User'

  has_many_attached :photos

  validates :name, :location, :date_from, :date_to, :price, presence: true
end
