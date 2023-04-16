require 'rest-client'

class ApplicationController < ActionController::Base
  before_action :authenticate_client

  def authenticate_client
    redirect_to new_login_path unless cookies[:access_code]
  end
end
