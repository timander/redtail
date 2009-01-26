class MailRobot < ActionMailer::Base

  helper :application
  
  def confirmation_email(user, hash, url)

    from "The Hungry Hawk <admin@hungryhawk.org>"
    recipients user.email
    subject "Confirm email address"
    
    @body["email"] = user.email
    @body["hash"] = hash
    @body["url"] = url

  end

  def reservation_email(user, reservation)

    from "The Hungry Hawk <admin@hungryhawk.org>"
    recipients user.email
    subject "Hungry Hawk Restaurant Reservation"
    
    @body["email"] = user.email
    @body["reservation_date"] = reservation.restaurant.date_formatted

  end
  
end
