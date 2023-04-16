# frozen_string_literal: true

class ApisController < ApplicationController
  skip_before_action :authenticate_freelancer
  skip_before_action :verify_authenticity_token

  def create
    client_access_code = Client.find_by(access_code: params[:access_code])
    render json: {
      success: client_access_code.present?
    }
  end

  def index
    client_access_code = Client.find_by(access_code: params[:access_code])
    render json: {
      success: client_access_code.present?
    }
  end
end
