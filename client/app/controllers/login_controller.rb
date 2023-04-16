# frozen_string_literal: true

class LoginController < ApplicationController
  skip_before_action :authenticate_client

  def new
    @client = ClientApi.new
  end

  def create
    body = RestClient.post 'localhost:3000/apis', { access_code: params.dig(:client_api, :access_code) }

    if JSON.parse(body.to_s)['success']
      cookies[:access_code] = params.dig(:client_api, :access_code)
      redirect_to projects_path
    else
      flash[:alert] = 'Did not work'
    end
  end
end
