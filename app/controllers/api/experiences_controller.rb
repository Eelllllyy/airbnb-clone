# frozen_string_literal: true

module Api
  class ExperiencesController < BaseController
    def index
      scope = Experience.includes(photos_attachments: :blob, video_attachment: :blob)
      @pagy, experiences = pagy(ExperienceQuery.new(scope).call(params))
      render json: ExperienceSerializer.render(experiences), status: :ok
    end
  end
end
