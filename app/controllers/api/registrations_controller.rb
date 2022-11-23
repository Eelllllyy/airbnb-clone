# frozen_string_literal: true

module Api
  class RegistrationsController < BaseController
    def create
      user = User.find_by(email: registrations_params[:email])
      return render_error(I18n.t('api.registrations.errors.email_already_exists')) if user

      user = User.new(registrations_params)
      status = user.save ? :created : :unprocessable_entity
      if status == :created
        UserMailer.with(user:).registration.deliver_later
        payload = { user_id: user.id }
        session = JWTSessions::Session.new(payload:, refresh_payload: payload, refresh_by_access_allowed: true)
        render json: session.login, status:
      else
        render json: UserSerializer.render(user, view: :with_errors), status:
      end
    end

    private

    def registrations_params
      params.require(:registration).permit(:name, :email, :password)
    end
  end
end
