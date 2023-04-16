class ApplicationController < ActionController::Base
  before_action :authenticate_freelancer!

  rescue_from ActiveRecord::RecordNotFound, with: :show_errors

  def show_errors
    redirect_to clients_path
  end
end
