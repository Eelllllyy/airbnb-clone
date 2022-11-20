# frozen_string_literal: true

class StaySerializer < BaseSerializer
  view :main do
    field :name
    field :location
    field :date_from
    field :date_to
    field :price
    field :rating
    field :photos do |obj|
      obj.photos.attached? ? obj.photos.map { FileSerializer.render_as_hash(_1, view: :url_only) } : []
    end
  end

  view :index do
    include_view :main
  end

  view :show do
    include_view :main
    association :host, blueprint: UserSerializer
  end
end
