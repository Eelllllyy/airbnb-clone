# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def registration
    @user = params[:user]
    mail(to: @user.email, subject: t('mailers.user_mailer.registration.subject'))
  end
end
