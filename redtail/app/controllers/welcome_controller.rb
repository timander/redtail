class WelcomeController < ApplicationController
  skip_filter :user_is_authenticated?

  def index
  end

end
