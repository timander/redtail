class AdminController < ApplicationController
  
  before_filter :admin?
  
  def index
    @user = session_user
  end
  
end
