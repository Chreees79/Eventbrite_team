# frozen_string_literal: true

# Service for users mail sending
class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url = 'https://eventbrite-team.herokuapp.com/'
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def attendances_email(admin)
    @user = admin
    @url = 'https://eventbrite-team.herokuapp.com/'
    mail(to: @user.email, subject: 'Un nouveau participant à votre évènement de merde')
  end
end
