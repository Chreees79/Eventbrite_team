class UserMailer < ApplicationMailer
  default from: 'germain.rgb@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'http://monsite.fr/login' #https://eventbrite-team.herokuapp.com/
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def attendances_email(admin)
    @user = admin
    @url = 'http://eventbrite.fr/event' #https://eventbrite-team.herokuapp.com/
    mail(to: @user.email, subject: 'Un nouveau participant à votre évènement de merde')
  end

end