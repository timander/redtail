class MailRobot < ActionMailer::Base
 
  def confirmation_email(user,hash)
    # email header info MUST be added here
    @recipients = user.email
    @from = "fromaddress@website-url-here.com"
    @subject = "Confirm email address"

    # email body substitutions go here
    @body["username"] = user.username
    @body["hash"] = hash
  end

end
