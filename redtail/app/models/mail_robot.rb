class MailRobot < ActionMailer::Base
 
  def confirmation_email(user,hash)
    # email header info MUST be added here
    @recipients = user.email
    @from = "admin@hungryhawk.org"
    @subject = "Confirm email address"

    # email body substitutions go here
    @body["email"] = user.email
    @body["hash"] = hash
  end

end
