class MailRobot < ActionMailer::Base

  helper :application
 
  def confirmation_email(user, hash, url)
    
      from "The Hungry Hawk <admin@hungryhawk.org>"
      recipients user.email
      subject "Confirm email address"
      content_type 'text/html'

      #body :key => options[:key], :domain => options[:domain]
      # email body substitutions go here
      @body["email"] = user.email
      @body["hash"] = hash
      @body["url"] = url

  end

end
