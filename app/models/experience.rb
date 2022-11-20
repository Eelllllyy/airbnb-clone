# frozen_string_literal: true

class Experience < ApplicationRecord
  belongs_to :host, class_name: 'User'

  has_one_attached :video
  has_many_attached :photos

  validates :name, :rating, :price, presence: true
end
