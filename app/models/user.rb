# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :stays, foreign_key: :host_id, dependent: :destroy, inverse_of: :host
  has_many :experiences, foreign_key: :host_id, dependent: :destroy, inverse_of: :host

  has_one_attached :avatar

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
