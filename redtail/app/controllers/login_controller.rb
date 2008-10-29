class LoginController < ApplicationController
  def index
    render :action => 'login'
  end

  def login
    account = Account.new
    if request.post?
      account.attributes = params[:account]
      account.try_to_authenticate
      if account.valid?
        session["user_id"] = account.id
        redirect_to :controller => "secure", :action => "index"
      end
    end
  end
end
