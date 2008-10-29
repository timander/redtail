class Account < ActiveRecord::Base
  
  # todo: lookup logic and other fun stuff
  def try_to_authenticate
    if email.nil? || password.nil? || email == password
      errors.add(:email, "bad login")
    end
  end
  
end
