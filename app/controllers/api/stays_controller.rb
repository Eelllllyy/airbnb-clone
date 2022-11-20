# frozen_string_literal: true

module Api
  class StaysController < BaseController
    def index
      scope = Stay.with_attached_photos
      @pagy, stays = pagy(StayQuery.new(scope).call(params))
      render json: StaySerializer.render(stays, view: :index), status: :ok
    end

    def show
      stay = Stay.find_by(id: params[:id])
      return render_error(I18n.t('api.stays.errors.not_found'), :not_found) unless stay

      render json: StaySerializer.render(stay, view: :show), status: :ok
    end
  end
end
