class ModelMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_user_notification.subject
  #
    def welcome_email(user)
      mail(:to => user.email, :subject => 'Welcome', :from => "Mailgun Sandbox" )
    end

  def send_simple_message(user)
  RestClient.post "https://api:#{Rails.application.credentials.mail_gun[:api_key]}"\
  "@api.mailgun.net/v3/sandboxe3cf2e49b9984a0091b7837f7c9d0362.mailgun.org/messages",
  :from => "You made a Task. <mailgun@sandboxe3cf2e49b9984a0091b7837f7c9d0362.mailgun.org>",
  :to => user.email,
  :subject => "Thank you for creating a Task",
  :text => "Thank you for creating a Task. I hope you enjoy your stay here with GigHelp"
end

  def transaction_message(user)
    RestClient.post "https://api:#{Rails.application.credentials.mail_gun[:api_key]}"\
    "@api.mailgun.net/v3/sandboxe3cf2e49b9984a0091b7837f7c9d0362.mailgun.org/messages",
    :from => "You accepted a bid. <mailgun@sandboxe3cf2e49b9984a0091b7837f7c9d0362.mailgun.org>",
    :to => user.email,
    :subject => "You accepted an offer - BID Accepted",
    :text => "Congrats! You've accepted an offer!"
  end



  def create
    @user = User.new(params)
    if @user.save
      ModelMailer.new_record_notification(@user).deliver
      format.html { redirect to @user }
  end
end

end
