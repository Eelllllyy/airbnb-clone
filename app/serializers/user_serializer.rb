# frozen_string_literal: true

class UserSerializer < BaseSerializer
  field :name
  field :email

  field :avatar do |obj|
    FileSerializer.render_as_hash(obj.avatar) if obj.avatar.attached?
  end
end
