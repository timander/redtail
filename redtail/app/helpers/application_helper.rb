# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  # Produces -> Thursday May 25, 2006
   def nice_date(date)
     h date.strftime("%A %B %d, %Y")
   end
   
   def admin?
     session_user.admin?
   end
  
end
