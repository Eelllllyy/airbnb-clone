# frozen_string_literal: true

class ExperienceSerializer < BaseSerializer
  field :name
  field :price
  field :rating
  field :photos do |obj|
    obj.photos.attached? ? obj.photos.map { FileSerializer.render_as_hash(_1, view: :url_only) } : []
  end
  field :video do |obj|
    FileSerializer.render_as_hash(obj.video, view: :url_only) if obj.video.attached?
  end

  association :host, blueprint: UserSerializer
end
